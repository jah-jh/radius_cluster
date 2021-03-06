


our (
  $Admin,
  $db,
  %conf,
  $argv,
  $base_dir,
  @MODULES
);

use Time::Piece;
use Users;
use Tariffs;
use Hotspot;
use Abills::Base qw/_bp/;

my $t = localtime;
my $admin = $Admin;
my $users = Users->new($db, $admin, \%conf);
my $Tariffs = Tariffs->new( $db, \%conf, $admin );
my $Hotspot = Hotspot->new( $db, \%conf, $admin );


my $Sessions = ();
my $Internet = ();
if (in_array( 'Internet', \@MODULES )) {
  require Internet;
  require Internet::Sessions;
  $Internet = Internet->new($db, $admin, \%conf);
  $Sessions = Internet::Sessions->new($db, $admin, \%conf);
}
else {
  require Dv;
  require Dv_Sessions;
  $Internet = Dv->new($db, $admin, \%conf);
  $Sessions = Dv_Sessions->new($db, $admin, \%conf);
}

my $list = list_users();
my $dead_users_hash = dead_list($list);
backup_users($dead_users_hash);
delete_users($dead_users_hash);
exit;
#**********************************************************
=head2 list_users()

=cut
#**********************************************************
sub list_users {
  my $gid = $argv->{GROUP} || '';
  my $tp_id = $argv->{TP_ID} || '';

  if ($argv->{GUESTS}) {
    my $tp_list = $Tariffs->list({
      PAGE_ROWS    => 1,
      SORT         => 1,
      NAME         => '_SHOW',
      PAYMENT_TYPE => 2,
      COLS_NAME    => 1,
      NEW_MODEL_TP => 1,
    });
    if ($Tariffs->{TOTAL} < 1) {
      print "No guest tp\n";
      exit;
    }
    $tp_id = $tp_list->[0]->{tp_id};
  }
  else {
    print "Use GUESTS=1 for delete users with guest account.\n";
    exit;
  }

  my $list = $Internet->list({
    GID       => $gid,
    TP_ID     => $tp_id,
    ONLINE    => '_SHOW',
    UID       => '_SHOW',
    LOGIN     => '_SHOW',
    PHONE     => '_SHOW',
    PAGE_ROWS => 99999,
    COLS_NAME => 1,
  });
  return $list;
}

#**********************************************************
=head2 dead_list()

=cut
#**********************************************************
sub dead_list {
  my ($list) = @_;
  my $users_hash;
  my $last_activity_date = '';
  if ($argv->{PERIOD}) {
    $last_activity_date = $argv->{PERIOD};
  }
  else {
    my $t2 = $t - 604800;
    $last_activity_date = $t2->ymd;
  }
  my $alive_list = $Sessions->reports2({
    INTERVAL  => $last_activity_date . "/" . $t->ymd,
    COLS_NAME => 1,
    PAGE_ROWS => 99999,  
  });

  foreach my $user (@$list) {
    next if (defined($user->{online}));
    $users_hash->{$user->{uid}} = $user;
  }
  foreach my $line (@$alive_list) {
    delete($users_hash->{$line->{uid}});
  }
  return $users_hash;
}

#**********************************************************
=head2 backup_users()

=cut
#**********************************************************
sub backup_users {
  my ($users_hash) = @_;
  my $filedir = '/usr/abills/var/';
  my $filename = $t->ymd('_') . "_hotspot_users.bak";
  open(my $fh, '>', "$filedir/$filename") or die "Can't open '$filename'";

  foreach my $uid (keys %$users_hash) {
    my $list = $Sessions->list({
      UID       => $uid,
      LOGIN     => '_SHOW',
      PHONE     => '_SHOW',
      START     => '_SHOW',
      END       => '_SHOW',
      CID       => '_SHOW',
      IP        => '_SHOW',
      COLS_NAME => 1,
    });

    print $fh "LOGIN: $users_hash->{$uid}->{login}, UID: $uid, PHONE: " . ($users_hash->{$uid}->{phone} || '') . "\n";
    if ($Sessions->{TOTAL} < 1) {
      print $fh "\n\n";
      next;
    }
    foreach my $line (@$list) {
      my $hs_name = _hotspot_name($line->{cid}, $line->{start});
      print $fh "NAS: " . ($hs_name || '') . 
      ", IP: " . ($line->{ip} || '') .
      ", MAC: " . ($line->{cid} || '') .
      ", start: " . ($line->{start} || '') .
      ", end: " . ($line->{end}   || '') . "\n";
    }
    print $fh "\n\n";
  }
  close $fh;

  return 1;
}

#**********************************************************
=head2 delete_users()

=cut
#**********************************************************
sub delete_users {
  my ($users_hash) = @_;
  foreach my $uid (keys %$users_hash) {
    $users->{UID} = $uid;
    $users->del({
      UID      => $uid,
      COMMENTS => 'Hotspot users clean',
    });
    $Sessions->del("", "", "", "", {DELETE_USER => $uid});
  }
  return 1;
}

#**********************************************************
=head2 _hotspot_name()

=cut
#**********************************************************
sub _hotspot_name {
  my ($mac, $date) = @_;

  my $list = $Hotspot->log_list({
    HOTSPOT   => '_SHOW',
    DATE      => "<=$date",
    CID       => $mac,
    PAGE_ROWS => 1,
    SORT      => 'date',
    DESC      => 'DESC',
    COLS_NAME => 1,
  });

  return $list->[0]->{hotspot};
}


1;