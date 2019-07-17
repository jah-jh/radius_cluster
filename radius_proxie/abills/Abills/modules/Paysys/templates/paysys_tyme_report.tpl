<form action=$SELF_URL METHOD=POST >
<input type='hidden' name='index' value=$index>
<input type='hidden' name='filter' value=1>
  
<div class='box box-theme box-form form-horizontal'>
  
<div class='box-heading with-border text-primary'><h4 class='box-title'>_{FILTERS}_</h4></div>

<div class='box-body'>

  <div class='form-group'>
    <label class='control-label col-md-3'>_{TERMINALS}_</label>
    <div class='col-md-9'>
      %TERMINAL_SELECT%
    </div>
  </div>
    <div class='form-group'>
    <label class='control-label col-md-3 '>_{DATE}_ _{BEGIN}_</label>
    <div class='col-md-9'>
      <input type='text' name='DATE_START'  value='$FORM{DATE_START}' placeholder='%TIME_START%' class='form-control datepicker' >
   </div>
  </div>

  <div class='form-group'>
    <label class='control-label col-md-3 '>_{DATE}_ _{END}_</label>
    <div class='col-md-9'>
      <input type='text' name='DATE_END'  value='$FORM{DATE_END}' placeholder='%TIME_END%' class='form-control datepicker' >
   </div>
  </div>
</div>

<div class='box-footer'>
  <button type='submit' class='btn btn-primary'>_{SHOW}_</button>
</div>
</div>
</form>