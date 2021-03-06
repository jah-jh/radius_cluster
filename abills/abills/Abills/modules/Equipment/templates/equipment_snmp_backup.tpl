<form action='#' name='EQUIPMENT_SNMP_BACKUP' id='EQUIPMENT_SNMP_BACKUP' method='post' class='form form-horizontal'>
  <input type='hidden' name='qindex' value='$index'/>
  <input type='hidden' name='header' value='2'/>

  <input type='hidden' name='NAS_ID' value='%NAS_ID%'/>
  <input type='hidden' name='OPERATION' value='$FORM{OPERATION}'/>
  <input type='hidden' name='action' value='1'/>

  <!--
    <div class='form-group'>
      <label class='control-label col-md-4 required' for='NAS_IP_id'>IP</label>
      <div class='col-md-8'>
        <input type='text' class='form-control' name='NAS_IP' required='required' readonly='readonly' value='%NAS_IP%'
               id='NAS_IP_id'/>
      </div>
    </div>

    <div class='form-group'>
      <label class='control-label col-md-4 required' for='VENDOR_NAME_id'>_{VENDOR}_</label>
      <div class='col-md-8'>
        <input type='text' class='form-control' name='VENDOR_NAME' required='required' readonly='readonly'
               value='%VENDOR_NAME%' id='VENDOR_NAME_id'/>
      </div>
    </div>

    <div class='form-group'>
      <label class='control-label col-md-4 required' for='MODEL_NAME_id'>_{MODEL}_</label>
      <div class='col-md-8'>
        <input type='text' class='form-control' name='MODEL_NAME' required='required' readonly='readonly'
               value='%MODEL_NAME%' id='MODEL_NAME_id'/>
      </div>
    </div>

    <div class='form-group' data-tooltip='_{REQUIRED_ARG}_ _{FOR}_ D-Link'>
      <label class='control-label col-md-4' for='REVISION_id'>_{REVISION}_</label>
      <div class='col-md-8'>
        <input type='text' class='form-control' name='REVISION' value='%REVISION%' id='REVISION_id'/>
      </div>
    </div>
-->

  <div class='form-group' data-tooltip='\$conf{TFTP_SERVER_IP}'>
    <label class='control-label col-md-3 required' for='TFTPSERVER_id'>TFTP IP</label>
    <div class='col-md-9'>
      <input type='text' class='form-control' name='TFTPSERVER' required='required' value='%TFTPSERVER%'
             id='TFTPSERVER_id'/>
    </div>
  </div>

  <div class='form-group'>
    <label class='control-label col-md-3 required' for='BACKUP_NAME_id'>Backup _{NAME}_</label>
    <div class='col-md-9'>
      <input type='text' class='form-control' name='BACKUP_NAME' required='required' value='%BACKUP_NAME%'
             id='BACKUP_NAME_id'/>
    </div>
  </div>

  <hr/>

  <div class='row text-right'>
    <input type='submit' class='btn btn-primary' id='action_btn' name='action' value='_{EXECUTE}_'>
  </div>

</form>

<script>
  jQuery(function () {
    "use strict";

    var _ajax_form = jQuery('#EQUIPMENT_SNMP_BACKUP');
    var _act_btn   = jQuery('#action_btn');
    var _modal     = jQuery('#CurrentOpenedModal');


    bindAjaxFormSubmit();

    function uploadForm(form) {
      var url = "/admin/index.cgi";

      _act_btn.html('<span class="fa fa-spinner fa-pulse"></span>');
      _act_btn.addClass('disabled');

      var data = jQuery(form).serialize();

      console.log('submit');
      jQuery.ajax({
        url        : url, // Url to which the request is send
        type       : "get",             // Type of request to be send, called as method
        data       : data, // Data sent to server, a set of key/value pairs (i.e. form fields and values)
        contentType: false,       // The content type used when sending data to the server.
        cache      : false,             // To unable request pages to be cached
        processData: false,        // To send DOMDocument or non processed data file it is set to false
        success    : function (data) {  // A function to be called if request succeeds

          _modal.find('.modal-body').empty().html(data);

          setTimeout(function () {
            location.reload(false);
          }, 4000);
        }
      });
    }

    function bindAjaxFormSubmit() {
      _ajax_form.on('submit', function (e) {
        e.preventDefault();
        uploadForm(this);
      });
    }

  });
</script>


