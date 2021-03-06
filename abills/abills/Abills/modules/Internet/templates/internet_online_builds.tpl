<div class='row  form form-inline'>

  <div class='checkbox'>
    <label>
      <input type='checkbox' checked='checked' id='SHOW_ONLINE'>
      _{ONLINE}_
    </label>
  </div>
  <div class='checkbox'>
    <label>
      <input type='checkbox' checked='checked' id='SHOW_OFFLINE'>
      _{OFFLINE}_
    </label>
  </div>
  <div class='checkbox'>
    <label>
      <input type='checkbox' checked='checked' id='SHOW_EMPTY'>
      _{EMPTY}_
    </label>
  </div>
  <div class='form-group'>
    <button class='btn btn-default' id='OPEN_ALL'><span class="fa fa-plus"></span>&nbsp;_{OPEN_ALL}_</button>
  </div>
  <div class='form-group'>
    <button class='btn btn-default' id='CLOSE_ALL'><span class="fa fa-minus"></span>&nbsp;_{CLOSE_ALL}_</button>
  </div>

</div>

<div class='row' id='DISTRICT_PANELS'>
  %DISTRICT_PANELS%
</div>

<script>
  jQuery(function () {

    var online_chb  = jQuery('input#SHOW_ONLINE');
    var offline_chb = jQuery('input#SHOW_OFFLINE');
    var empty_chb   = jQuery('input#SHOW_EMPTY');

    var open_btn  = jQuery('button#OPEN_ALL');
    var close_btn = jQuery('button#CLOSE_ALL');

    var district_panels = jQuery('div#DISTRICT_PANELS');

    open_btn.on('click', function (e) {
      cancelEvent(e);
      district_panels.find('button[data-widget="collapse"]').find('i.fa-plus').click();
    });

    close_btn.on('click', function (e) {
      cancelEvent(e);
      district_panels.find('button[data-widget="collapse"]').find('i.fa-minus').click();
    });


    var current_states = {
      online : true,
      offline: true,
      empty  : true
    };

    var checkbox_btn_class = {
      online : 'btn-success',
      offline: 'btn-danger',
      empty  : 'btn-default'
    };

    var element_for_checkbox_id = {
      online : online_chb,
      offline: offline_chb,
      empty  : empty_chb,
    };

    var saveState = function () {
      aStorage.setValue('internet_online_builds', JSON.stringify(current_states));
    };

    var toggle_elements_visibility = function (selector, state) {
      state
          ? jQuery(selector).show()
          : jQuery(selector).hide();
    };

    var build_checkbox_click_cb = function (checkbox_id) {
      return function () {
        var state = jQuery(this).prop('checked');
        toggle_elements_visibility('a.btn-build.' + checkbox_btn_class[checkbox_id], state);

        // Save to memory
        current_states[checkbox_id] = state;

        // Save to storage
        saveState();
      }
    };

    online_chb.on('click', build_checkbox_click_cb('online'));
    offline_chb.on('click', build_checkbox_click_cb('offline'));
    empty_chb.on('click', build_checkbox_click_cb('empty'));

    var checkbox_saved_state_string = aStorage.getValue('internet_online_builds', JSON.stringify(current_states));
    try {
      var checkbox_saved_state = JSON.parse(checkbox_saved_state_string);

      // Iterating over current states ( for empty saved value ), but using values from storage
      for (var checkbox_id in current_states) {
        if (!current_states.hasOwnProperty(checkbox_id)) continue;
        var state = checkbox_saved_state[checkbox_id];
        console.log(checkbox_id, state);

        toggle_elements_visibility('a.btn-build.' + checkbox_btn_class[checkbox_id], state);
        element_for_checkbox_id[checkbox_id].prop('checked', state);
      }

      current_states = checkbox_saved_state;
    }
    catch (e) {
      console.log(e);
    }

  });
</script>
