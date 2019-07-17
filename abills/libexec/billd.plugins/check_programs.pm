=head1 NAME

  billd plugin

=head2  DESCRIBE

 Check run programs and run if they shutdown

=cut
#**********************************************************


our (
  $debug,
  %conf,
  $admin,
  $db,
  $OS,
  $argv
);

use strict;
use warnings;
use Abills::Base qw(startup_files cmd);

check_programs();


#**********************************************************
=head2 check_programs()

=cut
#**********************************************************
sub check_programs {
  print "Check run programs\n" if ($debug > 1);

  if (! $argv->{PROGRAMS}) {
    print "Select programs: PROGRAMS=...\n";
    return 0;
  }

  my @programs = split(/;/, $argv->{PROGRAMS});

  my %START_PROGRAM = (
    RESTART_RADIUSD     => '/usr/local/etc/rc.d/radiusd start',
    RESTART_IPCAD       => '/usr/local/bin/ipcad -d',
    RESTART_FLOWCAPTURE => '/usr/local/etc/rc.d/flow-capture start',
    %{ startup_files() }
  );

  foreach my $line (@programs) {
    my ($name, $start_cmd) = split(/:/, $line, 2);
    if ($debug > 1) {
      print "Program: $name, $start_cmd\n";
    }

    my @ps = split m|$/|, qx/ps axc | grep $name/;
    if ($debug > 1) {
      print join("\n", @ps)."\n";
    }

    if ($#ps < 0) {
      if (! $start_cmd && $START_PROGRAM{'RESTART_'.uc($name)}) {
        $start_cmd=$START_PROGRAM{'RESTART_'.uc($name)};
      }
      elsif ($name eq 'radiusd' && ! $start_cmd) {
        if ($OS eq 'freebsd') {
          $start_cmd="/usr/local/etc/rc.d/radiusd start";
        }
      }

      my $cmd_result = cmd($start_cmd, { SHOW_RESULT => 1 });
      print "$name Program not runnting: $cmd_result\n";
    }
  }

  return 1;
}


1
