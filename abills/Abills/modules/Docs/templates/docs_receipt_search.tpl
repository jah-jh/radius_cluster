<div class='col-xs-12 col-md-6'>
    <input type=hidden name=COMPANY_ID value='$FORM{COMPANY_ID}'>
    <div class='box box-theme'>
        <div class='box-body'>
            <div class='form-group'>
                <label class='col-md-3 control-label'>_{CUSTOMER}_ (*):</label>
                <div class='col-md-9'>
                    <input class='form-control' type=text name=CUSTOMER value='%CUSTOMER%'>
                </div>
            </div>
            <div class='form-group'>
                <label class='col-md-3 control-label'>ID (>,<):</label>
                <div class='col-md-9'>
                    <input class='form-control' type=text name=DOC_ID value='%DOC_ID%'>
                </div>
            </div>
            <div class='form-group'>
                <label class='col-md-3 control-label'>_{ADMIN}_:</label>
                <div class='col-md-9'>
                    <input class='form-control' type=text name=AID value='%AID%'>
                </div>
            </div>
            <div class='form-group'>
                <label class='col-md-3 control-label'>_{SUM}_:</label>
                <div class='col-md-9'>
                    <input class='form-control' type=text name=SUM value='%SUM%'>
                </div>
            </div>
            <div class='form-group'>
                <label class='col-md-3 control-label'>_{PAYMENT_METHOD}_:</label>
                <div class='col-md-9'>
                    %PAYMENT_METHOD_SEL%
                </div>
            </div>
            <div class='form-group'>
                <label class='col-md-3 control-label'>_{PAYMENTS}_ ID:</label>
                <div class='col-md-9'>
                    <input class='form-control' type=text name=PAYMENT_ID value='%PAYMENT_ID%'>
                </div>
            </div>
        </div>
    </div>
</div>
