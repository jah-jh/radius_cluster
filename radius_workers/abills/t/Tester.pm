#!/usr/bin/perl
package Tester;
use strict;
use warnings FATAL => 'all';
use v5.16;
#test specific
use Test;
use TAP::Harness;

our ($libpath, @libs, $Bin);

BEGIN {
  use FindBin '$Bin';
  $libpath = $Bin . '/../';
  
  @libs = (
    $Bin,
    $libpath,
    $libpath . '../',
    $libpath . 'lib',
    $libpath . 'libexec',
    $libpath . 'Abills',
    $libpath . 'Abills/modules',
    $libpath . 'Abills/mysql',
    $libpath . '/misc/mikrotik',
  );
  
  unshift @INC, @libs;
}

use Abills::Base qw/_bp parse_arguments/;
use Abills::Misc;

our (
  $sql_type,
  $global_begin_time,
  %conf,
  @MODULES,
  %functions,
  %FORM,
  $html,
  $index,
  $users
);

require "libexec/config.pl";

my $modules_directory = "$libpath/Abills/modules";
my $nases_directory = "$libpath/lib/Abills/Nas";
my $sender_directory = "$libpath/lib/Abills/Sender";

my $harness = TAP::Harness->new( {
#  verbosity => 1,
  color     => 1,
  jobs      => 4,
  lib       => \@libs,
} );

my %ARGS = %{ parse_arguments(\@ARGV) };

my @tests = ();
if ( defined $ARGS{MODULE} ) {
  # First arg is name of module
  push @tests,  @{ get_list_of_files_in( "$modules_directory$ARGS{MODULE}/t", 't' ) };
}
elsif ( defined $ARGS{NAS} ) {
  push @tests, @{ get_list_of_files_in( "$nases_directory$ARGS{NAS}/t", 't' ) };
}
elsif ( $ARGS{DIRECTORY} ) {
  push @tests, @{ get_list_of_files_in( $ARGS{DIRECTORY}, 't' ) };
}
else {
  
  @tests = @{ find_tests_in( [
    $modules_directory,
    $nases_directory,
    $sender_directory
  ] )};
  
}

if ( exists $ARGS{FILTER} && defined $ARGS{FILTER} ) {
  @tests = filter_tests(\@tests, $ARGS{FILTER});
}

map { print "Test : $_ \n" } @tests;

my $res = $harness->runtests( sort @tests );
#$harness->summary($res);


#**********************************************************
=head2 find_tests_in($test_dirs)

=cut
#**********************************************************
sub find_tests_in {
  my ($test_dirs) = @_;
  
  my @found = ();
  foreach my $dir (@{$test_dirs}){
    if (! -d $dir){
      print "Wrong dir given $dir \n";
      next;
    };
    print "Looking in $dir \n";
    push @found, @{ _get_files_in($dir, { FULL_PATH => 1, RECURSIVE => 1, FILTER => '\.t$' })}
  }
  
  return \@found;
}

#**********************************************************
=head2 get_list_of_files_in($dir_name[, $extension]) - get filenames in a directory

  Arguments:
     $dir_name    - directory to look in
     [$extension] - filter by extension

  Returns:
    \@arr_ref     - filenames

=cut
#**********************************************************
sub get_list_of_files_in {
  my ($dir_name, $extension) = @_;
  
  my @result = ();
  
  if ( !-e $dir_name ) {
    print "  Directory not exists $dir_name \n ";
    return;
  }
  
  opendir ( my $dir_inside, $dir_name ) or do {
    print "  Can't open $dir_name \n";
    return;
  };
  
  while (my $file = readdir( $dir_inside )) {
    next if ( $extension && $file !~ /\.$extension$/ );
    
    print "Found $dir_name/$file \n";
    
    push ( @result, "$dir_name/$file" );
  }
  
  closedir( $dir_inside );
  
  return \@result;
}

#**********************************************************
=head2 filter_tests($list, $filter)

=cut
#**********************************************************
sub filter_tests {
  my ($list, $filter) = @_;
  
  say 'Filter using =~ /' . $filter . '/';
  
  my @new_list = sort grep { $_ =~ $filter } @{$list};
  
  return wantarray ? @new_list : \@new_list;
}


1;