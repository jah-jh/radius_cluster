<!--<style>
    #_main {
        min-height: 250px;
    }

    #_address {
        min-height: 250px;
    }

    #_comment {
        min-height: 150px;
    }
</style>-->

<form class='form-horizontal' action='$SELF_URL' name='users_pi' METHOD='POST' ENCTYPE='multipart/form-data'>

  <input type='hidden' name='index' value='$index'>
  %MAIN_USER_TPL%
  <input type=hidden name=UID value='%UID%'>

  <!-- General panel -->
  <div class='box box-theme box-big-form'>
    <div class='box-header with-border'><h3 class="box-title">_{INFO}_</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-minus"></i>
        </button>
      </div>
    </div>

    <div class="box-body" style="padding: 0">
      <div style="padding: 10px">

        <div class='form-group'>
          <label class='control-label col-xs-4' for='FIO'>_{FIO}_</label>
          <div class='col-xs-8'>
            <input name='FIO' class='form-control' id='FIO' value='%FIO%'>
          </div>
        </div>

        <div class='form-group' data-visible='%OLD_CONTACTS_VISIBLE%' style='display:none'>
          <label class='control-label col-xs-4' for='PHONE'>_{PHONE}_</label>
          <div class='col-xs-8'>
            <div class="input-group">
              <input id='PHONE' name='PHONE' value='%PHONE%' placeholder='%PHONE%'
                     class='form-control' type='text'
                     data-inputmask='{"mask" : "(999) 999-9999", "removeMaskOnSubmit" : true}' />

              <div class="input-group-addon">
                <i class="fa fa-phone"></i>
              </div>
            </div>
          </div>
        </div>

        <div class='form-group' data-visible='%OLD_CONTACTS_VISIBLE%' style='display:none'>
          <label class='control-label col-xs-4' for='EMAIL'>E-mail (;)</label>
          <div class='col-xs-8'>
            <div class='input-group'>
              <input id='EMAIL' name='EMAIL' value='%EMAIL%' placeholder='%EMAIL%'
                     class='form-control' type="text">
              <span class='input-group-addon'>
                    <a href='$SELF_URL?UID=$FORM{UID}&get_index=msgs_admin&add_form=1&SEND_TYPE=1&header=1&full=1'
                       class='fa fa-envelope'></a>
                    </span>
            </div>
          </div>
        </div>

        <!-- Contact panel -->
        %CONTACTS%
        <!-- Address panel -->
        %ADDRESS_TPL%
        <!-- comment panel -->
        <div class='form-group'>
          <label class='control-label col-sm-2' for='COMMENTS'>_{COMMENTS}_</label>
          <div class='col-sm-10'>
             <textarea class='form-control' id='COMMENTS' name='COMMENTS' rows='3'>%COMMENTS%</textarea>
          </div>
        </div>
      </div>
      <!-- Pasport panel -->
      <div class="box box-default box-big-form collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">_{PASPORT}_</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
        <div class="box-body">
          <div class='form-group'>
            <!-- <label class='col-md-12 bg-primary'>_{PASPORT}_</label> -->
            <label class='control-label col-xs-4 col-md-2' for='PASPORT_NUM'>_{NUM}_</label>
            <div class='col-xs-8 col-sm-4'>
              <input id='PASPORT_NUM' name='PASPORT_NUM' value='%PASPORT_NUM%'
                     placeholder='%PASPORT_NUM%'
                     class='form-control' type='text'>
            </div>
            <span class="visible-xs visible-sm col-xs-12" style="padding-top: 10px"> </span>
            <label class='control-label col-xs-4 col-md-2' for='PASPORT_DATE'>_{DATE}_</label>
            <div class='col-xs-8 col-sm-4'>
              <input id='PASPORT_DATE' type='text' name='PASPORT_DATE' value='%PASPORT_DATE%'
                     class='datepicker form-control'>
            </div>
          </div>
          <div class='form-group'>
            <label class='control-label col-xs-4 col-md-2' for='PASPORT_GRANT'>_{GRANT}_</label>
            <div class='col-xs-8 col-md-10'>
                    <textarea class='form-control' id='PASPORT_GRANT' name='PASPORT_GRANT'
                              rows='2'>%PASPORT_GRANT%</textarea>
            </div>
          </div>

        </div>
      </div>
      <!-- Contract fields -->
      <div class="box box-default box-big-form collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">_{CONTRACT}_</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
        <div class="box-body">
          %ACCEPT_RULES_FORM%
          <div class='form-group'>
            <label class='control-label col-xs-4 col-md-2' for='CONTRACT_ID'>_{CONTRACT_ID}_
              %CONTRACT_SUFIX%</label>
            <div class='col-xs-8 col-md-4'>
              <div class='input-group'>
                <input id='CONTRACT_ID' name='CONTRACT_ID' value='%CONTRACT_ID%'
                       placeholder='%CONTRACT_ID%' class='form-control' type='text'>
                <span class='input-group-addon'>%PRINT_CONTRACT%</span>
                <span class='input-group-addon'><a
                    href='$SELF_URL?qindex=15&UID=$FORM{UID}&PRINT_CONTRACT=%CONTRACT_ID%&SEND_EMAIL=1&pdf=1'
                    class='glyphicon glyphicon-envelope' target=_new>
                                        </a></span>
              </div>
            </div>
            <span class="visible-xs visible-sm col-xs-12" style="padding-top: 5px"> </span>
            <label class='control-label col-xs-4 col-md-2' for='CONTRACT_DATE'>_{DATE}_</label>
            <div class='col-xs-8 col-md-4'>
              <input id='CONTRACT_DATE' type='text' name='CONTRACT_DATE'
                     value='%CONTRACT_DATE%' class='datepicker form-control'>
            </div>
          </div>
          %CONTRACT_TYPE%
        </div>
      </div>
      <!-- Other panel  -->
      <div class="box box-default box-big-form collapsed-box">
        <div class="box-header with-border">
          <h3 class="box-title">_{EXTRA_ABBR}_. _{FIELDS}_</h3>
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-plus"></i>
            </button>
          </div>
        </div>
        <div class="box-body">
          %INFO_FIELDS%
        </div>
      </div>


    </div>
    <div class='box-footer'>
      <input type=submit class='btn btn-primary' name='%ACTION%' value='%LNG_ACTION%'>
    </div>
  </div>

</form>

