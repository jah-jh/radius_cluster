<div class='box box-theme box-form collapsed-box'>
    <div class='box-header with-border'>
        <h3 class="box-title">_{EXTRA}_</h3>
        <div class="box-tools pull-right">
            <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i
                    class="fa fa-plus"></i>
            </button>
        </div>
    </div>
    <div class='box-body'>

  <div class='form-group'>
  	<label class='col-md-12 control-label bg-primary'>DHCP</label>
  </div>			
  <div class='form-group'>
  	<label class='col-md-3 control-label'>_{HOSTS_HOSTNAME}_:</label>
  	<div class='col-md-9'><input class='form-control' type=text name=HOSTNAME value='%HOSTNAME%'></div>
  </div>			
  <div class='form-group'>
  	<label class='col-md-3 control-label'>_{HOSTS_NETWORKS}_:</label>
  	<div class='col-md-9'>%NETWORKS_SEL%</div>
  </div>
  <div class='form-group'>
  	<label class='col-md-3 control-label'>IP:</label>
  	<div class='col-md-9'>
  		<input class='form-control' type=text name=IP value='%IP%' > 
  	</div>
  </div>
  <div class='form-group'>
	  <label class='col-md-3 control-label'>Option 82:</label>
	  <div class='col-md-9'>
		  <input  type=checkbox name=OPTION_82 value='1' >
	  </div>
  </div>

  <div class='form-group'>
  	<label class='col-md-3 control-label'>_{HOSTS_MAC}_:<BR>(00:00:00:00:00:00)</label>
  	<div class='col-md-9'><input class='form-control' type=text name=MAC value='%MAC%'></div>
  </div>
    </div>
</div>

