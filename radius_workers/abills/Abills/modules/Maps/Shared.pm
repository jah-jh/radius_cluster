package Maps::Shared;
use strict;
use warnings FATAL => 'all';

=head1 NAME

  Maps::Shared - values that have to be equal all over modules using Maps

=head2 SYNOPSIS

  This package aggregates global values Maps module uses

=cut

use Exporter;
use parent 'Exporter';

use constant {
  LAYER_ID_BY_NAME        => {
    'BUILD'        => 1,
    'WIFI'         => 2,
    'ROUTE'        => 3,
    'DISTRICT'     => 4,
    'TRAFFIC'      => 5,
    'CUSTOM_POINT' => 6,
    'EQUIPMENT'    => 7,
    'GPS'          => 8,
    'GPS_ROUTE'    => 9,
    'BUILD2'       => 12,
    'PON'          => 20,
  },
  MAPS_ICONS_DIR_WEB_PATH => '/images/maps/icons/',
  MAPS_ICONS_DIR          => '/Abills/templates/maps/icons/',
  CLOSE_OUTER_MODAL_SCRIPT => q\
  <script>
    setTimeout(function(){aModal.hide()}, 2000);
    Events.emit('modal_closed');
  </script>
  \
};

our $MAPS_ENABLED_LAYERS = {};

our @EXPORT = qw/
  LAYER_ID_BY_NAME
  $MAPS_ENABLED_LAYERS
  MAPS_ICONS_DIR_WEB_PATH
  MAPS_ICONS_DIR
  CLOSE_OUTER_MODAL_SCRIPT
  /;

our @EXPORT_OK = qw/LAYER_ID_BY_NAME $MAPS_ENABLED_LAYERS/;

our %EXPORT_TAGS = (
  all => \@EXPORT
    );

1;