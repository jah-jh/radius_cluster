package Abills::Backend::Plugin::Websocket;
use strict;
use warnings FATAL => 'all';

our (%conf, $base_dir, $debug, $ARGS, @MODULES);

use Abills::Backend::Plugin::BasePlugin;
use parent 'Abills::Backend::Plugin::BasePlugin';

use Abills::Backend::Log;
our Abills::Backend::Log $Log;

use Abills::Backend::PubSub;
our Abills::Backend::PubSub $Pub;

# Localizing global variables
use Abills::Backend::Defs;
use Abills::Base qw/_bp/;

use Abills::Backend::Plugin::Websocket::API;
use Abills::Backend::Plugin::Websocket::SessionsManager;
use Abills::Backend::Plugin::Websocket::Admin;
use Abills::Backend::Utils qw/json_decode_safe json_encode_safe/;

use Protocol::WebSocket::Handshake::Server;
use Protocol::WebSocket::Frame;

#my %sessionManagers = (
#  admin  => Abills::Backend::Plugin::Websocket::SessionsManager->new({ CLIENT_CLASS => 'Admin' }),
#  client => Abills::Backend::Plugin::Websocket::SessionsManager->new({ CLIENT_CLASS => 'Client' })
#);

our Abills::Backend::Plugin::Websocket::SessionsManager $adminSessions;
our Abills::Backend::Plugin::Websocket::SessionsManager $clientSessions;

my $OPCODE_CLOSE = 0x8;
my $OPCODE_PING = 0x9;
my $OPCODE_PONG = 0xA;

my $api;

#**********************************************************
=head2 new($conf) - constructor for Abills::Backend::Plugin::Websocket

=cut
#**********************************************************
sub new {
  my $class = shift;
  
  my ($db, $admin, $CONF) = @_;
  
  my $self = {
    db    => $db,
    admin => $admin,
    conf  => $CONF,
  };
  
  bless($self, $class);
  
  return $self;
}

#**********************************************************
=head2 init($attr)

  Arguments:
     $attr - reserved
    
  Returns:
    1
  
=cut
#**********************************************************
sub init {
  my ($self, $attr) = @_;
  
  # Starting websocket server
  $Log->info("Starting WebSocket server");
  
  $self->{session_managers} = {
    admin  => Abills::Backend::Plugin::Websocket::SessionsManager->new({ CLIENT_CLASS => 'Admin' }),
    client => Abills::Backend::Plugin::Websocket::SessionsManager->new({ CLIENT_CLASS => 'Client' })
  };
  
  $adminSessions = $self->{session_managers}->{admin};
  $clientSessions = $self->{session_managers}->{client};
  
  AnyEvent::Socket::tcp_server('127.0.0.1', $conf{WEBSOCKET_PORT} || 19443, sub {
      $self->new_admin_websocket_client(@_);
    });
  
  
  #  $self->_register_listeners();
  
  $api = Abills::Backend::Plugin::Websocket::API->new($self->{session_managers});
  
  return $api;
}

#**********************************************************
=head2 _register_listeners()

=cut
#**********************************************************
sub _register_listeners {
  my ($self) = @_;
  
}

#**********************************************************
=head2 new_admin_websocket_client()

=cut
#**********************************************************
sub new_admin_websocket_client {
  my ($self, $socket_pipe_handle, $host, $port) = @_;
  
  my $socket_id = "$host:$port";
  $Log->debug("Admin connection : $socket_id");
  
  my $handshake = Protocol::WebSocket::Handshake::Server->new;
  
  my $handle = AnyEvent::Handle->new(
    fh       => $socket_pipe_handle,
    no_delay => 1
  );
  
  # On message
  $handle->on_read(
    sub {
      my AnyEvent::Handle $this_client_handle = shift;
      
      # Read and clear read buffer
      my $chunk = $this_client_handle->{rbuf};
      $this_client_handle->{rbuf} = undef;
      
      # If it is handshake, do all protocol related stuff
      if ( !$handshake->is_done ) {
        $self->_do_handshake($this_client_handle, $chunk, $handshake);
        if ( my $aid = Abills::Backend::Plugin::Websocket::Admin::authenticate($chunk) ) {
          if ( $aid == - 1 ) {
            $this_client_handle->push_shutdown;
          }
          else {
            $Log->debug("Authorized admin $aid ");
            $adminSessions->save_handle($handle, $socket_id, $aid);
          }
        }
        
        return;
        
      }
      else {
        $self->on_websocket_message($this_client_handle, $socket_id, $chunk);
      }
    }
  );
  
  # On close
  $handle->on_eof(
    sub {
      # Try to do it "good way"
      unless ( $adminSessions->remove_session_by_socket_id($socket_id) ) {
        # And otherwise kick it's face
        $handle->destroy;
        undef $handle;
      }
    }
  );
  
  $handle->on_error(
    sub {
      my AnyEvent::Handle $read_handle = shift;
      
      return unless ( defined $read_handle );
      
      $Log->debug("Error happened with admin $socket_id ");
      
      $read_handle->push_shutdown;
      $read_handle->destroy;
      
      undef $handle;
    }
  )
};


#**********************************************************
=head2 on_websocket_message($read_handle)

=cut
#**********************************************************
sub on_websocket_message {
  my ( $self, $this_client_handle, $socket_id, $chunk) = @_;
  
  my $frame = Protocol::WebSocket::Frame->new;
  
  $frame->append($chunk);
  
  while ( my $message = $frame->next ) {
    my $opcode = $frame->opcode;
    
    # Client breaks connection
    if ( $opcode == $OPCODE_CLOSE ) {
      #$message eq "\x{3}\x{fffd}" || $frame->opcode == 8) {
      #      $Log->debug( "Client $socket_id breaks connection" );
      $adminSessions->remove_session_by_socket_id($socket_id, "Client $socket_id breaks connection");
      return;
    };
    
    if ( $opcode == $OPCODE_PING || $opcode == $OPCODE_PONG ) {
      # Todo treat as alive
      return;
    }
    
    my $decoded_message = json_decode_safe($message);
    
    if ( !$decoded_message ) {
      $Log->debug("Bad JSON");
      return;
    }
    
    if ( defined $decoded_message && ref $decoded_message eq 'HASH' && $decoded_message->{TYPE} ) {
      
      if ( $decoded_message->{TYPE} eq 'CLOSE_REQUEST' ) {
        $self->drop_client($socket_id, 'by client request');
      }
      elsif ( $decoded_message->{TYPE} eq 'PONG' ) {
        # Do nothing TODO: Treat as alive
        return;
      }
      elsif ( $decoded_message->{TYPE} eq 'RESPONCE' ) {
        # Do nothing TODO: Treat as alive
        return;
      }
      else {
        my %response;
        
        # TODO: define message hadlers for types
        if ( $decoded_message->{TYPE} eq 'PING' ) {
          %response = (DATA => 'RESPONCE', TYPE => 'PONG');
        }
        else {
          %response = (DATA => $decoded_message);
        }
        
        #        my $response_text = json_encode_safe( process_message( \%response ) );
        my $response_text = json_encode_safe(\%response);
        
        $this_client_handle->push_write($frame->new($response_text)->to_bytes);
      }
    }
  }
  
}


#**********************************************************
=head2 drop_client($socket_id, $reason)

=cut
#**********************************************************
sub drop_client {
  my ($self, $socket_id, $reason) = @_;
  
  foreach ( values %{$self->{session_managers}} ) {
    my Abills::Backend::Plugin::Websocket::SessionsManager $sessions_manager = $_;
    if ( $sessions_manager->has_client_with_socket_id($socket_id) ) {
      $sessions_manager->remove_session_by_socket_id($socket_id, $reason);
      last;
    }
  }
  
}

#**********************************************************
=head2 drop_all_clients($reason)

=cut
#**********************************************************
sub drop_all_clients {
  my ($self, $reason) = shift;
  
  foreach ( values %{$self->{session_managers}} ) {
    my Abills::Backend::Plugin::Websocket::SessionsManager $sessions_manager = $_;
    $sessions_manager->drop_all_clients($reason);
  }
  
  return 1;
}

#**********************************************************
=head2 _do_handshake()

=cut
#**********************************************************
sub _do_handshake {
  my ($self, $this_client_handle, $chunk, $handshake) = @_;
  
  $handshake->parse($chunk);
  
  if ( $handshake->is_done ) {
    $this_client_handle->push_write($handshake->to_string);
    return 1;
  }
  
  return 0;
}

DESTROY {
  $Log->info("Websocket server stopped") if ( $Log );
}

1;