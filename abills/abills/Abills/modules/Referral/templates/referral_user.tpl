<div class='box box-theme text-left'>
    <div class='box-body'>
        <div class='row %REFFERER_ROW_HIDDEN%'>
            <span class='col-md-3'>_{REFERRER}_</span>
            <div class='col-md-9'>
                %REFERRER%
            </div>
        </div>
        <div class='row'>
            <span class='col-md-3'>_{CHANGE}_ _{REFERRAL}_</span>
            <div class='col-md-9'>
                %SEARCH_BUTTON%
            </div>
        </div>
        <div class='row %SHOW_BUTTON_HIDDEN%'>
            <span class='col-md-3'>_{SHOW}_ _{REFERRALS_LIST}_</span>
            <div class='col-md-9'>
                %SHOW_BUTTON%
            </div>
        </div>
    </div>
</div>

<script>
    jQuery(function(){
      Events.on('search_form.value_selected.UID', function(data_str){
        var uid = 0, login = 0;
        var uid_login = data_str.split('#@#');

        uid = uid_login[0].split('::')[1];
        login = uid_login[1].split('::')[1]

        // Send request to bind login
        jQuery.post('index.cgi', {
          qindex: '$index',
          header: '2',
          set : 1,
          REFERRAL_UID: '$FORM{UID}',
          REFERRER_UID: uid
        }, function(){location.reload(true)});
      });
    });
</script>