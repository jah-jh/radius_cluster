<form action='$SELF_URL' METHOD='POST' class='form-horizontal'>
  <input type='hidden' name='index' value='$index'>
  <input type='hidden' name='chg' value='$FORM{chg}'>
   
    <div class='box box-theme box-big-form'>
      <div class='box-header with-border'><h3 class='box-title'>_{DOMAINS}_</h3></div>
      <div class='box-body'>
        <div class='form-group'>
                    <label class='control-label col-md-3' for='NAME'>_{NAME}_</label>
                    <div class='col-md-9'>
                        <input id='NAME' name='NAME' value='%NAME%' placeholder='%NAME%' class='form-control'
                               type='text'>
                    </div>
                </div>

                <div class='form-group'>
                  <label class='control-label col-md-3' for='DATE'>_{CREATED}_</label>
                  <div class='col-md-5'>
                    <input type='date' class='form-control' readonly name='DATE' value=%CREATED%>
                  </div>
                
				  <div class='col-md-4'>
		            <label class='control-label'>_{DISABLE}_</label>
		            <input name='STATE' value='1' %STATE% type='checkbox'>
		
			      </div>
				</div>

                <div class='form-group'>
                    <div class='col-md-12'>
                        _{COMMENTS}_
                    </div>
                </div>

                <div class='form-group'>
                    <div class='col-md-12'>
                        <textarea cols=60 rows=6 name='COMMENTS' class='form-control'>%COMMENTS%</textarea>
                    </div>
                </div>

        </div>
        <div class='panel-footer'>
            <input type='submit' name='%ACTION%' value='%LNG_ACTION%' class='btn btn-primary'>
        </div>
    </div>
</form>
