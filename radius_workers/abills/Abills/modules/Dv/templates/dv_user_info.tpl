<div class='alert alert-danger' style='padding: 0' data-visible='%HAS_PAYMENT_MESSAGE%'>%PAYMENT_MESSAGE%</div>

<div class='box box-theme'>
  <div class='box-header with-border text-center'><h4 class='box-title'>_{DV}_</h4></div>
  <div class='box-body no-padding'>


      %PAYMENT_MESSAGE%
    <div class='box-body'>
      <h4 class='box-title text-center'>%NEXT_FEES_WARNING%</h4>
    </div>
      %SERVICE_EXPIRE_DATE%

    <div class='panel-body'>
      <div class='table table-striped table-hover'>
        <div class='row'>
          <div class='col-md-3 text-1'>_{TARIF_PLAN}_:</div>
          <div class='col-md-9 text-2'>[%TP_ID%] <b>%TP_NAME%</b> <span class='extra'>%TP_CHANGE% </span> <br>%COMMENTS%
          </div>
        </div>

        <div class='row'>
          <div class='col-md-3 text-1'>_{MONTH_FEE}_:</div>
          <div class='col-md-9 text-2'><b><span style='color : red'>%MONTH_ABON%</span></b>
          </div>
        </div>
        <div class='row'>
          <div class='col-md-3 text-1'>_{DAY_FEE}_:</div>
          <div class='col-md-9 text-2'><b><span style='color : red'>%DAY_ABON%</span></b>
          </div>
        </div>

        <div class='row'>
          <div class='col-md-3 text-1'>_{STATIC}_ IP</div>
          <div class='col-md-9 text-2'>%IP%</div>
        </div>

        <div class='row'>
          <div class='col-md-3 text-1'>MAC _{ADDRESS}_</div>
          <div class='col-md-9 text-2'>%CID%</div>
        </div>
        <div class='row'>
          <div class='col-md-3 text-1'>_{STATUS}_</div>
          <div class='col-md-9 text-2'>%STATUS_VALUE% %HOLDUP_BTN%</div>
        </div>

      </div>
    </div>
  </div>

<!--User cabinet footer will be broken if uncomment -->
</div>

