<style>
  #contact_submit {
    margin-left: 20px;
  }
</style>

<form action='$SELF_URL' class='form-horizontal'>
  <input type=hidden  name=index value='$index'>
  <input type=hidden  name=subf value='%subf%'>

  <fieldset>
<input type='hidden' name='DEFAULT_CONTACT_TYPES' value='%DEFAULT_TYPES%'>

<div id='contacts_json' aria-hidden='true' style='display: none'>{ %JSON% }</div>
<!-- FOR REG WIZARD -->
<div class="form-group">
  <div class="box box-theme ">
    <div class="box-header with-border">
      <h3 class="box-title">_{CONTACTS}_</h3>
      <div class="box-tools pull-right">
        <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-minus"></i>
        </button>
      </div>
    </div>
    <div class="box-body" style="display: block;">
      <div id='contacts_wrapper'></div>
      <div id='contacts_controls'>
        <div class='col-xs-8'>
          <span class='text-success' id='contacts_response'></span>
        </div>
        <div class='col-xs-4 text-right'>
          <button role='button' id='contact_remove' class='btn btn-xs btn-danger'>
            <span class='glyphicon glyphicon-remove'></span>
          </button>

          <button role='button' id='contact_add' class='btn btn-xs btn-success'>
            <span class='glyphicon glyphicon-plus'></span>
          </button>

          <button role='button' id='contact_submit' class='btn btn-xs btn-primary disabled'>
            <span class='glyphicon glyphicon-ok'></span>
          </button>
        </div>
      </div>

    </div>
  </div>
</div>


<!-- Mustache.min.js template -->
<script id='contacts_modal_body' type='x-tmpl-mustache'>
   <div class='form-group contact'>
     <div class='col-md-6'>
       <select class='form-control' name='type_id' id='contacts_type_select'>
         {{ #types }}
           <option value='{{ id }}'>{{ name }}</option>
         {{ /types }}
       </select>
     </div>
     <span class="visible-xs visible-sm col-xs-12" style="padding-top: 10px"> </span>
     <div class='col-md-6'>
      <input type='text' class='form-control' id='contacts_type_value' name='value' />
     </div>
   </div>


</script>

<script id='contact_template' type='x-tmpl-mustache'>

 <div class='form-group contact'>
   <label class='control-label col-xs-2'>{{name}}</label>
   <div class='col-xs-8'>
     <input class='form-control' type='text' {{#form}}form='{{form}}'{{/form}} name='{{type_id}}' {{#value}}value='{{value}}'{{/value}}/>
   </div>
 </div>


</script>

<script>
  var CONTACTS_LANG = {
    'CONTACTS': '_{CONTACTS}_',
    'CANCEL'  : '_{CANCEL}_',
    'ADD'     : '_{ADD}_',
    'REMOVE'  : '_{REMOVE}_'
  }
</script>

<script src='/styles/default_adm/js/user_form.js'></script>
</fieldset>
</form>
