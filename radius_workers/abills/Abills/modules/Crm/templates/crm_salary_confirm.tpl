<form method='POST'>

<input type='hidden' name='index' value='$index'>
<input type='hidden' name='AID' value='%AID%'>
<input type='hidden' name='YEAR' value='%YEAR%'>
<input type='hidden' name='MONTH' value='%MONTH%'>
  
<div class='box box-theme box-form form-horizontal'>
  
<div class='box-header with-border'>_{SALARY}_</div>

<div class='box-body'>
  
<div class='form-group'>
  <label class='control-label col-md-3'>_{FIO}_</label>
  <div class='col-md-9'>
    <input type='text' name='FIO' value='%FIO%' class='form-control'>
  </div>
</div>
<div class='form-group'>
  <label class='control-label col-md-3'>_{CASHBOX}_</label>
  <div class='col-md-9'>
    %CASHBOX%
  </div>
</div>
<div class='form-group'>
  <label class='control-label col-md-3'>_{SPENDING}_ _{TYPE}_</label>
  <div class='col-md-9'>
    %SPENDING_TYPE_ID%
  </div>
</div>
<div class='form-group'>
  <label class='control-label col-md-3'>_{BET}_</label>
  <div class='col-md-9'>
    <input type='text' name='BET' value='%BET%' class='form-control'>
  </div>
</div>
<div class='form-group'>
  <label class='control-label col-md-3'>_{EXTRA}_</label>
  <div class='col-md-9'>
    <input type='text' name='EXTRA_AMOUNT' value='%EXTRA_AMOUNT%' class='form-control'>
  </div>
</div>
<div class='form-group'>
  <label class='control-label col-md-3'>_{MONTH}_</label>
  <div class='col-md-9'>
  <div class='input-group'>
    <input type='text' name='TEXT_MONTH' value='%TEXT_MONTH%' class='form-control'>
    <span class="input-group-addon" id="basic-addon2">%YEAR% _{YEAR}_</span>
    </div>
  </div>
</div>

<div class='form-group'>
  <label class='control-label col-md-3'>_{SUM}_</label>
  <div class='col-md-9'>
    <input type='text' name='SUM' value='%SUM%' class='form-control'>
  </div>
</div>

</div>

<div class='box-footer'>
  <input type='submit' name='confirm' value='_{CONFIRM}_' class='btn btn-primary'>
</div>

</div>

</form>