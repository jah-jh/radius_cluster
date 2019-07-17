<script>
  var index     = '$index';
  var map_index = '%MAP_INDEX%';
  var map_edit_index = '%MAP_EDIT_INDEX%';

  var MAP_TYPE = '%MAP_TYPE%' || 'google';
  var MAP_KEY  = '%MAP_API_KEY%';

  var CLIENT_MAP = '%CLIENT_MAP%';

  var _NAVIGATION_WARNING        = '_{NAVIGATION_WARNING}_' || 'You have disabled retrieving your location in browser';
  var _NOW_YOU_CAN_REMOVE_MARKER = '_{NOW_YOU_CAN_REMOVE_MARKER}_' || 'Now you can remove marker';
  var _NOW_YOU_CAN_ADD_NEW       = '_{NOW_YOU_CAN_ADD_NEW}_' || 'Now you can add new';
  var _MAP_OBJECT_LAYERS         = '_{MAP_OBJECT_LAYERS}_' || 'Map object Layers';

  var _CLICK_ON_A_MARKER_YOU_WANT_TO_DELETE = '_{CLICK_ON_A_MARKER_YOU_WANT_TO_DELETE}_' || 'Click on a marker you want delete';

  var _YES        = '_{YES}_';
  var _NO         = '_{NO}_';
  var _CANCEL     = '_{CANCEL}_';
  var _DISCARD    = '_{DISCARD}_';
  var _USER       = '_{USER}_';
  var _USERS      = '_{USERS}_';
  var _STREET     = '_{STREET}_';
  var _BUILD      = '_{BUILD}_';
  var _BUILD2      = '_{BUILD}_ POLYGON';  
  var _ROUTE      = '_{ROUTE}_' || 'Route';
  var _ROUTES     = '_{ROUTES}_' || 'Routes';
  var _WIFI       = '_{WIFI}_' || 'Wi-Fi';
  var _DISTRICT   = '_{DISTRICT}_' || 'District';
  var _WELL       = '_{WELL}_' || 'Well';
  var _OBJECT     = '_{OBJECT}_' || 'Object';
  var _GPS        = 'GPS';
  var _ADD        = '_{ADD}_' || 'Add';
  var _NEW        = '_{NEW}_' || 'New';
  var _POINT      = '_{POINT}_' || 'Point';
  var _BUILDS     = '_{BUILDS}_' || 'Builds';
  var _TRAFFIC    = '_{TRAFFIC}_' || 'Traffic';
  var _EQUIPMENT  = '_{EQUIPMENT}_' || 'Equipment';
  var _SEARCH     = '_{SEARCH}_' || 'Search';
  var _BY_QUERY   = '_{BY_QUERY}_' || 'By Query';
  var _QUERY      = '_{QUERY}_' || 'Query';
  var _BY_TYPE    = '_{BY_TYPE}_' || 'By Types';
  var _TOGGLE     = '_{TOGGLE}_' || 'Toggle';
  var _POLYGONS   = '_{POLYGONS}_' || 'Polygons';
  var _MARKER     = '_{MARKER}_' || 'Marker';
  var _CLUSTERS   = '_{CLUSTERS}_' || 'Clusters';
  var _REMOVE     = '_{REMOVE}_' || 'Remove';
  var _LOCATION   = '_{LOCATION}_' || 'Location';
  var _DROP       = '_{DROP}_' || 'Drop';
  var _MAKE_ROUTE = '_{MAKE_ROUTE}_' || 'Make Navigation Route';
  var _DEL_MARKER = '_{DELETE_MARKER}_' || 'Delete marker';
  var _TO_MAP     = '_{TO_MAP}_' || 'to map';
  var _NAVIGATION = '_{NAVIGATION}_' || 'Go to point';
  var _DISTANCE   = '_{DISTANCE}_' || 'Distance';
  var _DURATION   = '_{DURATION}_' || 'Duration';
  var _END        = '_{END}_' || 'End';
  var _START      = '_{START}_' || 'Start';

  //ENABLING FEATURES
  var SHOW_MARKERS              = '%SHOW_MARKERS%' || true;
  var CLUSTERING_ENABLED        = '%CLUSTERING_ENABLED%' || true;
  var DISTRICT_POLYGONS_ENABLED = '%DISTRICT_POLYGONS_ENABLED%' || false;

  //CONTROL BLOCK
  var layersCtrlEnabled     = true;
  var searchCtrlEnabled     = true;
  var navigationCtrlEnabled = '%NAVIGATION_BTN%' || false;

  //INPUT PARAMS
  var mapCenter    = '%MAPSETCENTER%';
  var CONF_MAPVIEW = '%MAP_VIEW%' || '';

  var form_query_search  = '%search_query%';
  var form_type_search   = '%search_type%';

  var form_nav_x = '%nav_x%';
  var form_nav_y = '%nav_y%';
  var form_quick = '%QUICK%';

  //Constants
  var BUILD        = "BUILD";
  var BUILD2       = "BUILD2";
  var ROUTE        = "ROUTE";
  var DISTRICT     = "DISTRICT";
  var WIFI         = "WIFI";
  var WELL         = "WELL";
  var NAS          = "NAS";
  var GPS          = "GPS";
  var GPS_ROUTE    = "GPS_ROUTE";
  var TRAFFIC      = "TRAFFIC";
  var CUSTOM_POINT = 'CUSTOM_POINT';
  var EQUIPMENT    = 'EQUIPMENT';

  var POINT            = "POINT";
  var LINE             = "LINE";
  var POLYGON          = "POLYGON";
  var CIRCLE           = "CIRCLE";
  var POLYLINE_MARKERS = "POLYLINE_MARKERS";
  var MARKER_CIRCLE    = "MARKER_CIRCLE";
  var MULTIPLE         = "MULTIPLE";

  var LAYERS           = JSON.parse('%LAYERS%');
  var LAYER_LIST_REFS  = JSON.parse('%LAYER_LIST_REFS%');
  var LAYER_ID_BY_NAME = JSON.parse('%LAYER_ID_BY_NAME%');
  var FORM             = JSON.parse('%FORM%');
  var OPTIONS          = JSON.parse('%OPTIONS%');
</script>
<!--Extra scripts-->
%EXTRA_SCRIPTS%
