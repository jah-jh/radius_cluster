<form action='$SELF_URL' METHOD='GET' name='user' ID='user' class='form-horizontal'>
  <input type=hidden name='index' value='$index'>
  <input type=hidden name='ID' value='%ID%'>
  <input type=hidden name='UID' value='%UID%'>

  <fieldset>
    <div class='box box-theme box-form'>
      <div class='box-header with-border'>
        <h4 class='box-title'>_{BINDING}_ IP_POOL</h4>
      </div>
      <div class='box-body'>
        <div class='form-group'>
          <label class='control-label col-md-3' for='POOL_ID'>IP_POOL: </label>
          <div class='col-md-9 text-left'>
            %POOL_ID%
          </div>
        </div>
        <div class='form-group'>
          <label class='control-label col-md-3'>_{COMMENTS}_</label>
          <div class='col-md-9'>
            <textarea class='form-control' name=COMMENTS rows=2 cols=15>%COMMENTS%</textarea>
          </div>
        </div>
        <div class='box-footer'>
          <input type=submit name=%ACTION% value='%LNG_ACTION%' class='btn btn-primary'>
          %DEL_BUTTON%
        </div>
      </div>
    </div>
  </fieldset>
</form>
