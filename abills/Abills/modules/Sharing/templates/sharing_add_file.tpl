<form method='POST'>

<input type='hidden' name='index' value='$index'>
<input type='hidden' name='ID' value='%ID%'>

<div class='box box-theme box-form form-horizontal'>

<div class='box-header with-border'>_{ADD}_ _{FILE}_</div>

<div class='box-body'>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{NAME}_</label>
    <div class='col-md-9'>
      <input type='text' name='NAME' value='%NAME%' class='form-control'>
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{AMOUNT}_</label>
    <div class='col-md-9'>
      <input type='text' name='AMOUNT' value='%AMOUNT%' class='form-control'>
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{VERSION}_</label>
    <div class='col-md-9'>
      <input type='text' name='VERSION' value='%VERSION%' class='form-control'>
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{GROUP}_</label>
    <div class='col-md-9'>
      %GROUP%
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{TIME_FOR_LINK}_</label>
    <div class='col-md-9'>
      <div class='input-group'>
      <input type='number' name='LINK_TIME' value='%LINK_TIME%' class='form-control'>
      <span class='input-group-addon' id='basic-addon1'>_{SECONDS}_</span>
      </div>
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{TIME_FOR_FILE}_</label>
    <div class='col-md-9'>
      <div class='input-group'>
        <input type='number' name='FILE_TIME' value='%FILE_TIME%' class='form-control'>
        <span class='input-group-addon' id='basic-addon2'>_{DAYS}_</span>
      </div>
      <!-- <input type='number' name='FILE_TIME' value='%FILE_TIME%' class='form-control'> -->
    </div>
  </div>

  <div class='form-group'>
  <label class='col-md-3 control-label'>_{COMMENTS}_</label>
    <div class='col-md-9'>
      <textarea class='form-control' name='COMMENT'>%COMMENT%</textarea>
    </div>
  </div>

</div>

<div class='box-footer'>
  <input type='submit' name='%BTN_NAME%' value='%BTN_VALUE%' class='btn btn-primary'>
</div>

</div>

</form>