/**
 * @author Victor Potapov
 * @URL http://victorpotapov.ru
 * @date 09.02.14
 * @version 1.0
 * @licence LinkWare
 */
var last_QBInfo_number = 0;

function hideQBinfo(id) {
  last_QBInfo_number--;
  $("#QBinfo_" + id).remove();
}

function getOptimaBottomQBinfo(margin, firstDiv, height) {
  
  if (last_QBInfo_number > 1) {
    var $Qdiv = $('#QBinfo_' + (last_QBInfo_number - 1));
    
    if ($Qdiv.css('top') == undefined || $Qdiv.css("height") == undefined) {
      return parseInt($(window).height()) - height - firstDiv + 'px';  // MARGIN FROM window browser
    }
    else {
      return parseInt((parseInt(($Qdiv.css("top")).slice(0, -2)) - parseInt(($Qdiv.css("height")).slice(0, -2)))) - margin + 'px';
    }
    
  }
  else {
    return parseInt($(window).height()) - height - firstDiv + 'px';
  }
  
}


function QBinfo(title, msg, group_id, event_id, seen_url) {
  
  var time        = 15000;
  var align       = 'bottom-left';
  var width       = 300;
  var height      = 100;
  var icon        = '/img/information.png';
  var position    = 'absolute';
  var effect      = 600;
  var time_effect = 'fade';
  
  // COUNT div's of QBinfo
  var id = ++last_QBInfo_number;
  
  /*
   * CSS STYLE FOR QBinfo
   */
  var margin   = 20;
  var firstDiv = 20;
  
  var QBtop  = getOptimaBottomQBinfo(margin, firstDiv, height);
  var QBleft = margin + 'px';
  
  /*
   * Initializations new QBinfo div
   */
  var d            = document.createElement('div');
  d.id             = "QBinfo_" + id;
  d.className      = "QBinfo";
  d.style.position = position;
  d.style.width    = width + 'px';
  d.style.height   = height + 'px';
  d.style.top      = QBtop;
  d.style.left     = QBleft;
  document.body.appendChild(d);
  
  /*
   * Input info in DIV
   */
  var codeInput = '<table border="0" class="topQBinfo" width="100%"><tr>'
      + '<td valign="middle" align="center" width="10%"><img src="' + icon + '" border="0" width="16" class="imgQBinfo" /></td>'
      + '<td valign="middle" align="left" class="titleQBinfo" width="80%">' + title + '</td>';
  
  if (group_id && group_id !== '1') {
    codeInput +=
        '<td valign="middle" align="right" class="qb_title_btn qb_unsubscribe_btn" width="10%">'
        + '  <a onclick="AMessageChecker.unsubscribe(' + id + ', ' + group_id + ')" ><span class="glyphicon glyphicon-eye-close"></span></a>'
        + '</td>';
  }
  if (seen_url) {
    codeInput +=
        '<td valign="middle" align="right" class="qb_title_btn qb_seen_btn" width="10%">'
        + ' <a onclick="AMessageChecker.seenMessage(' + id + ', \'' + seen_url + '\')" ><span class="glyphicon glyphicon-ok"></span></a>'
        + '</td>';
  }
  
  
  codeInput += '<td valign="middle" align="right" class="qb_title_btn qb_close_btn" width="10%">'
      + '<a onclick="hideQBinfo(' + id + ')" ><span class="glyphicon glyphicon-remove"></span></a>'
      + '</td>'
      
      + '</tr></table><div class="msgQBinfo">' + msg + '</div>';
  
  if (!soundsDisabled)
    codeInput += '<audio src="/styles/default_adm/bb2_new.mp3" type="audio/mpeg" preload="auto" autoplay></audio>';
  
  $('#QBinfo_' + id).html(codeInput);
  
  
  /*
   * SHOW and HIDE QBinfo
   */
  var $currentQB = $("#" + d.id);
  switch (effect) {
    case 'fade' :
      $currentQB.fadeToggle(time_effect);
      break;
    case 'slide' :
      $currentQB.slideToggle(time_effect);
      break;
    default:
      $currentQB.fadeToggle(time_effect);
      break;
  }
  
  if (time == 0) {
    //do nothing
  }
  else {
    setTimeout('hideQBinfo("' + id + '");', time);
  }
}

/**
 * Added by Anykey
 *
 *  No sound when showing QBInfo window
 *
 * @type {boolean}
 */
var soundsDisabled = false;
function setSoundsDisabled(disabled) {
  soundsDisabled = disabled;
  return soundsDisabled;
}

