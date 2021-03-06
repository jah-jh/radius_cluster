=head1 NAME

  IPoE Detail

  $conf{INTERNET_TRAFFIC_DETAIL} = 1;

=cut

use strict;
use warnings FATAL => 'all';
use Internet::Ipoe;
use Internet::Collector;
use Internet::Sessions;
use Abills::Base qw(int2byte);

our(
  %lang,
  $html,
  $db,
  $admin,
  %conf,
  $var_dir
);

my $Internet_ipoe  = Internet::Ipoe->new( $db, $admin, \%conf );
my $Sessions       = Internet::Sessions->new($db, $admin, \%conf);


#**********************************************************
=head2 traffic_detail() - Show Sessions from log

=cut
#**********************************************************
sub traffic_detail{
  $FORM{DST_IP_GROUP} = ' checked' if ($FORM{DST_IP_GROUP});
  $FORM{SRC_IP_GROUP} = ' checked' if ($FORM{SRC_IP_GROUP});
  $FORM{RESOLVE} = ' checked' if ($FORM{RESOLVE});

  form_search(
    {
      SEARCH_FORM     =>
      $html->tpl_show( _include( 'internet_detail_search', 'Internet' ), { %FORM }, { OUTPUT2RETURN => 1 } ),
      HIDDEN_FIELDS  => { UID => $FORM{UID} },
      SHOW_PERIOD    => 1
    }
  );

  if ( !$FORM{sort} ){
    $LIST_PARAMS{SORT} = 1;
    $LIST_PARAMS{DESC} = 'DESC';
  }

  if ( defined( $FORM{search} ) ){
    $LIST_PARAMS{INTERVAL} = "$FORM{FROM_DATE}/$FORM{TO_DATE}" if($FORM{FROM_DATE});
  }
  elsif ( $FORM{UID} ){
    return 0;
  }

  if($FORM{DEBUG} && $FORM{DEBUG} eq '10') {
    $Sessions->{debug}=1;
    $Internet_ipoe->{debug}=1;
  }

  if ( $LIST_PARAMS{LOGIN} && $FORM{LOGIN} ){
    my $session_list = $Sessions->list( { %LIST_PARAMS,
      IP         => '_SHOW',
      START      => '_SHOW',
      END        => '_SHOW',
      SESSION_ID => $FORM{ACCT_SESSION_ID} || '_SHOW',
      COLS_NAME  => 1
    } );

    if ( $Sessions->{TOTAL} ){
      $LIST_PARAMS{IP} = $session_list->[0]->{ip};
      $LIST_PARAMS{INTERVAL} = "$session_list->[0]->{start}/$session_list->[0]->{end}";
      if (! $FORM{qindex}) {
        $html->message( 'info', $lang{INFO}, "$lang{SESSION_ID}: $session_list->[0]->{acct_session_id}" );
        foreach my $line (@{$session_list}) {
          print $html->button( "$line->{start} - $line->{end}",
            "index=$index&LOGIN=$FORM{LOGIN}&ACCT_SESSION_ID=$line->{acct_session_id}&search=1", { BUTTON => 1 } )
        }
      }
    }
  }

  $LIST_PARAMS{SRC_IP} = ip_resolve( $LIST_PARAMS{SRC_IP} ) if ($LIST_PARAMS{SRC_IP});
  $LIST_PARAMS{DST_IP} = ip_resolve( $LIST_PARAMS{DST_IP} ) if ($LIST_PARAMS{DST_IP});

  my $list = $Internet_ipoe->user_detail( { UID => $user->{UID}, %LIST_PARAMS } );
  _error_show( $Internet_ipoe );
  $pages_qs =~ s/\&get_index=ipn_detail//g;
  my $table = $html->table(
    {
      caption    => $lang{DETAIL},
      width      => '100%',
      title      => [ $lang{BEGIN}, $lang{END}, "SRC_ADDR", "SRC_PORT", "DST_ADDR", "DST_PORT", "PROTOCOL", $lang{SIZE}, 'NAS' ],
      pages      => $Internet_ipoe->{TOTAL},
      qs         => $pages_qs,
      EXPORT     => 1,
      ID         => 'IPN_DETAIL'
    }
  );

  foreach my $line ( @{$list} ){
    my $src_name;
    my $dst_name;

    if ( $FORM{RESOLVE} ){
      $src_name = ip_resolve($line->[2]);
      $dst_name = ip_resolve($line->[4]);
    }

    $table->addrow( $line->[0],
      $line->[1],
      $src_name || $line->[2] || q{},
      $line->[3],
      $dst_name || $line->[4] || q{},
      $line->[5],
      $line->[6],
      $line->[7],
      $line->[8],
      $html->button( "",
        "index=" . get_function_index( 'internet_sessions' ) . "&IP=". ($line->[2] || q{}) .",". ($line->[4] || q{})."&START=<=$line->[0]&END=>=$line->[1]&search=1"
        , { ICON => 'glyphicon glyphicon-search', TITLE => $lang{SESSIONS} } )
    );
  }
  print $table->show();

  $table = $html->table(
    {
      width      => '100%',
      rows       => [ [ "$lang{TOTAL}:", $html->b( $Internet_ipoe->{TOTAL} ) ] ]
    }
  );

  print $table->show();

  return 1;
}

#**********************************************************
=head2 ip_resolve($hotname, $attr) - Resolve ip

=cut
#**********************************************************
sub ip_resolve{
  my ($hostname) = @_;

  if ( $hostname =~ /^$IPV4$/ ){
    return $hostname;
  }

  my $result_ips = $hostname;

  if ( my (undef, undef, undef,
    undef, @addrs) = gethostbyname( $hostname ) ){

    my @ips = ();

    foreach my $ip_v4 ( @addrs ){
      push @ips, join( '.', unpack( 'C4', $ip_v4 ) );
    }

    $result_ips = join( ', ', @ips );
  }
  else{
    print $html->message( 'err', $lang{ERROR}, "Can't resolv '$result_ips'" );
  }

  return $result_ips;
}


#**********************************************************
=head2 traffic_detail_ports()

=cut
#**********************************************************
sub traffic_detail_ports{

  if ( !$FORM{S_TIME} ){
    $FORM{S_TIME} = $DATE;
  }
  if ( !$FORM{F_TIME} ){
    $FORM{F_TIME} = $FORM{S_TIME};
  }

  my @known_ports = qw( 80 443 21 53 );

  my $ports_select = $html->form_select( 'PORTS', {
      SELECTED    => $FORM{PORTS},
      SEL_ARRAY   => \@known_ports,
      NO_ID       => 1,
      SEL_OPTIONS => { '' => '' },
      EX_PARAMS   => 'multiple="multiple"'
    } );

  $html->tpl_show( _include( "internet_detail_port", "Internet" ), { %FORM, PORTS_SELECT => $ports_select } );

  my $list = $Internet_ipoe->traffic_by_port_list( \%FORM );
  _error_show( $Internet_ipoe );

  my %traffic_by_ports = ();
  my @dates;
  foreach my $traffic_line ( @{$list} ){
    if ( $traffic_by_ports{$traffic_line->{dst_port}} ){
      push @{ $traffic_by_ports{$traffic_line->{dst_port}} }, $traffic_line->{size};
    }
    else{
      $traffic_by_ports{$traffic_line->{dst_port}} = [ $traffic_line->{size} ];
    }
    push ( @dates, $traffic_line->{datetime} =~ /(\d+[:]\d+)[:]\d+/ );
  }

  #filtering obvious
  my $chart = $html->make_charts(
    {
      TRANSITION    => 1,
      TYPE          => { work_time => 'area', kilometers => 'area' },
      X_TEXT        => \@dates,
      DATA          => \%traffic_by_ports,
      OUTPUT2RETURN => 1,
    }
  );

  print $chart;

  return 1;
}


#**********************************************************
=head2 ipn_unknow_ips() - List of unknown ips

=cut
#**********************************************************
sub ipoe_unknow_ips{

  if ( !$FORM{sort} ){
    $LIST_PARAMS{SORT} = 1;
    $LIST_PARAMS{DESC} = 'desc';
  }

  if ( !$conf{UNKNOWN_IP_LOG} ){
    $html->message( 'warn', '', "$lang{DISABLE} \$conf\{UNKNOWN_IP_LOG\}" );
  }

  if ( $FORM{del_all} && $FORM{COMMENTS} ){
    $Internet_ipoe->unknown_ips_del();
    if ( !_error_show( $Internet_ipoe ) ){
      $html->message( 'info', $lang{INFO}, "$lang{DELETED}" );
    }
  }

  my $list = $Internet_ipoe->unknown_ips_list( { %LIST_PARAMS } );
  my $table = $html->table(
    {
      caption    => "$lang{UNKNOWN} IP",
      width      => '100%',
      title      => [ $lang{DATE}, $lang{FROM}, $lang{TO}, $lang{SIZE}, 'NAS' ],
      pages      => $Internet_ipoe->{TOTAL},
      qs         => $pages_qs,
      header     => $html->button( "$lang{DEL} $lang{ALL}", "index=$index&del_all=1",
        { MESSAGE => "$lang{DEL} $lang{ALL}?", class => 'btn btn-default' } ),
      ID         => 'IPN_UNKNOWN_LIST'
    }
  );

  foreach my $line ( @{$list} ){
    $table->addrow( $line->[0],
      $html->button( $line->[1],
        "index=7&search=1&type=999&LOGIN=" . $line->[1],
        { ex_params => 'TARGET=ip' } ),
      $html->button( $line->[2],
        "index=7&search=1&type=999&LOGIN=" . $line->[2],
        { ex_params => 'TARGET=ip' } ),
      $line->[3],
      $line->[4]
    );
  }
  print $table->show();

  $table = $html->table(
    {
      width => '100%',
      rows  =>
      [ [ "$lang{TOTAL}: " . $html->b( $Internet_ipoe->{TOTAL} ), "$lang{TRAFFIC}: " . $html->b( int2byte( $Internet_ipoe->{TOTAL_TRAFFIC} ) ) ] ],
      ID    => 'IPN_UNKNOWN_LIST_TOTAL'
    }
  );
  print $table->show();

  return 1;
}

#**********************************************************
=head2 ipoe_ft_queue() - Flow-tools queue

=cut
#**********************************************************
sub ipoe_ft_queue{
  my $ft_dir = $conf{INTERNET_FT_DIR} || ($var_dir . '/log/ipn/');

  my @contents = ();

  if ( opendir my $fh, "$ft_dir" ){
    @contents = grep !/^\.\.?$/, readdir $fh;
    closedir $fh;
  }
  else{
    $html->message( 'err', $lang{ERROR}, "Can't open dir '$ft_dir' $!" );
    return 1;
  }

  my $table = $html->table(
    {
      width       => '600',
      caption     => "Flow-tools queue",
      title_plain => [ $lang{NAME}, $lang{DATE}, $lang{SIZE}, '-' ],
      ID          => 'IPN_FT_QUEUE',
    }
  );

  foreach my $filename ( sort @contents ){
    my ($size, $mtime) = (stat( "$ft_dir/$filename" ))[7,9];
    my $date = POSIX::strftime( "%Y-%m-%d %H:%M:%S", localtime( $mtime ) );
    $table->addrow( $filename,
      $date,
      int2byte( $size ),
      #$html->button($lang{DEL}, "index=$index&del=$filename", { MESSAGE => "$lang{DEL} $filename?", class => 'del' })
    );
  }

  print $table->show();

  return 1;
}


1;