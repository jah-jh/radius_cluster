<form action=$SELF_URL METHOD=POST class='form-horizontal'>

<input type='hidden' name='index' value=%INDEX%>
<input type='hidden' name='UID' value=%UID%>
<input type='hidden' name='action' value=%ACTION%>

<div class='box box-theme box-form'>
<div class='box-header with-border text-primary'>3PlayBox</div>

<div class='box-body'>
	<div class='form-group'>
        <label class='col-md-4 control-label'>_{TARIF_PLAN}_</label>
		<div class='col-md-8'>
			%TP_SELECT%
		</div>
	</div>
	<div class='form-group'>
		%SERVICES_INFO%
	</div>
</div>

<div class='box-footer'>
	<button type='submit' class='btn btn-primary'>%BUTTON%</button>
</div>

</div>


</form>