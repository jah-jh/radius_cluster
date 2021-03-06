package Abills::Backend::Plugin::Internal::API;
use strict;
use warnings FATAL => 'all';

=head1 NAME

  Abills::Backend::Plugin::Internal::API - 

=head2 SYNOPSIS

  API to internal Plugin

=cut

use Abills::Backend::Plugin::BaseAPI;
use parent 'Abills::Backend::Plugin::BaseAPI';

use Abills::Backend::Utils qw/json_encode_safe/;

#**********************************************************
=head2 process_internal_message($data)

  Arguments:
     $data - payload
    
  Returns:
    hash_ref or 0
    
    
=cut
#**********************************************************
sub process_internal_message {
  my ($self, $data) = @_;
  return 0 unless ( $data || !ref $data );
  
  my $responce = 1;
  
  if ( $data->{ECHO} ) {
    $responce = $data->{ECHO};
  };
  
  return (ref $responce ? json_encode_safe($responce) : $responce);
}



1;