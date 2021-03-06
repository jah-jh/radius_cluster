<link rel='stylesheet' type='text/css' href='/styles/lte_adm/plugins/morris/morris.css'>
<script type='text/javascript' src='/styles/default_adm/js/raphael.min.js'></script>
<script type='text/javascript' src='/styles/lte_adm/plugins/morris/morris.min.js'></script>

<div class='box box-theme'>
  <!-- head -->
  <div class='box-header with-border'><h3 class="box-title">_{SPEED_CHARTS}_</h3></div>
  <!-- body -->
  <div class='box-body'>
    <div id="graph" style="background-color: white; height: 500px;"></div>
    <div id="reloadStatus">
    </div>
  </div>
  <div class="box-footer">
    <font color="red">_{SPEED_IN}_ </font>
    <font color="blue">_{SPEED_OUT}_</font>
  </div>
</div>


<script id="code" class="prettyprint linenums">
  var dps = [];
  var last1 = 0;
  var last2 = 0;
  var timeout = 0;
  var lasttime = 0;

  function data() {
    jQuery.post('$SELF_URL', 'header=2&get_index=equipment_graph_info&PORT=%PORT%&NAS_COMMUNITY=%NAS_COMMUNITY%&NAS_IP=%NAS_IP%', function (result) {
      var call = result.split(":");
      var cin = call[0];
      var cout = call[1];
      var time = call[2];
      timeout = time - lasttime;
      lasttime = time;
      if (timeout == 0 || timeout > 10 || timeout < 4) {
        return dps;
      }
      var delta1 = cin - last1;
      // console.log(result);
      if (last1 == 0) {
        delta1 = 0;
      }
      delta1 = delta1 * 8 / 1000 / 1000 / timeout;
      last1 = cin;

      var delta2 = cout - last2;
      if (last2 == 0) {
        delta2 = 0;
      }
      delta2 = delta2 * 8 / 1000 / 1000 / timeout;
      last2 = cout;

      dps.push({x: new Date().toLocaleTimeString(), y: +delta1.toFixed(5), z: +delta2.toFixed(5)});
      // console.log(",delta1=" + delta1 + ",timeout=" + timeout + ",delta2=" + delta2);
    });
    return dps;
  }

  var graph = Morris.Line({
    element: 'graph',
    data: dps,
    xkey: 'x',
    ykeys: ['y', 'z'],
    labels: ['IN', 'OUT'],
    parseTime: false,
    ymin: 0,
    // ymax: 10.0,
    lineColors: ['#f00', '#49c'],
    hideHover: true,
  });

  function update() {
    // console.log(dps.length);

    if (dps.length >= 10) {

      dps.shift();
    }
    // data();
    graph.setData(data());
  }

  window.onload = function () {
    setInterval(update, 7000);
  };

</script>