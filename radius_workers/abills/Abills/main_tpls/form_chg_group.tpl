<form action='$SELF_URL' class='form-horizontal'>

<input type='hidden' name='index' value='11'>
<input type='hidden' name='UID' value='%UID%'>
<input type='hidden' name='user_f' value='chg_group'>
<input type='hidden' name='DISABLE' value='%DISABLE%'>

<fieldset>
<div class='box box-theme box-form'>
<div class='box-header with-border'><h4 class='box-title'>_{GROUP}_</h4></div>
<div class='box-body'>



<div class='form-group'>
	  <label class='control-label col-md-3' for='GROUP'>_{GROUP}_</label>
	  <div class='col-md-9'>
	  	  %GID%:%G_NAME%
	  	</div>
	 </div>

<div class='form-group'>
	  <label class='control-label col-md-3' for='GID'>_{TO}_</label>
	  <div class='col-md-9'>
	  	  %SEL_GROUPS%
	  	</div>
	 </div>
</div>
<div class='box-footer text-center'>
 <input type='submit' name='change' value='_{CHANGE}_' class='btn btn-primary'>
  </div>
</div>

</fieldset>
</form>


