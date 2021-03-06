<form action='$SELF_URL' METHOD='POST' class='form-horizontal' name=admin_form>
    <input type=hidden name='index' value='%INDEX%'>
    <input type=hidden name='AID' value='%AID%'>
    <fieldset>
        <div class='col-md-6'>
            <div class='box box-theme'>
                <div class='box-header with-border'><h4 class='box-title'>_{ADMINS}_</h4></div>
                <div class='box-body' style='padding: 0'>
                    <div style='padding: 10px'>
                        <div class='form-group'>
                            <label class='control-label col-md-3' for='A_LOGIN'>_{LOGIN}_:</label>
                            <div class='col-md-9'>
                                <input id='A_LOGIN' name='A_LOGIN' value='%A_LOGIN%' placeholder='%A_LOGIN%'
                                       class='form-control' type='text'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='A_FIO'>_{FIO}_:</label>
                            <div class='col-md-9'>
                                <input id='A_FIO' name='A_FIO' value='%A_FIO%' placeholder='%A_FIO%'
                                       class='form-control'
                                       type='text'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3'>_{POSITION}_</label>
                            <div class='col-md-9'>
                                %POSITIONS%
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='DISABLE'>_{DISABLE}_:</label>
                            <div class='col-md-9'>
                                <input id='DISABLE' name='DISABLE' value='1' %DISABLE% type='checkbox'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='PHONE'>_{PHONE}_:</label>
                            <div class='col-md-9'>
                                <input id='PHONE' name='PHONE' value='%PHONE%' placeholder='%PHONE%'
                                       class='form-control'
                                       type='text'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='CELL_PHONE'>_{CELL_PHONE}_:</label>
                            <div class='col-md-9'>
                                <input id='CELL_PHONE' name='CELL_PHONE' value='%CELL_PHONE%' placeholder='%CELL_PHONE%'
                                       class='form-control' type='text'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='EMAIL'>E-Mail:</label>
                            <div class='col-md-9'>
                                <input id='EMAIL' name='EMAIL' value='%EMAIL%' placeholder='%EMAIL%'
                                       class='form-control'
                                       type='text'>
                            </div>
                        </div>

                        <div class='form-group'>
                            <label class='control-label col-md-3' for='ADDRESS'>_{ADDRESS}_:</label>
                            <div class='col-md-9'>
                                <input id='ADDRESS' name='ADDRESS' value='%ADDRESS%' placeholder='%ADDRESS%'
                                       class='form-control' type='text'>
                            </div>
                        </div>

                    </div>
                    <div class='box box-theme collapsed-box'>
                        <div class='box-header with-border' class='center'>
                            <h3 class="box-title">_{PASPORT}_</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-minus"></i>
                                </button>
                            </div>
                        </div>

                        <div id='_passport' class='box-collapse box-body'>

                            <div class='form-group'>
                                <label class='control-label col-md-3' for='PASPORT_NUM'>_{NUM}_:</label>
                                <div class='col-md-9'>
                                    <input id='PASPORT_NUM' name='PASPORT_NUM' value='%PASPORT_NUM%'
                                           placeholder='%PASPORT_NUM%' class='form-control' type='text'>
                                </div>
                            </div>

                            <div class='form-group'>
                                <label for='PASPORT_DATE' class='control-label col-sm-3'>_{DATE}_:</label>
                                <div class='col-md-9'>
                                    %PASPORT_DATE%
                                </div>
                            </div>

                            <div class='form-group'>
                                <label class='control-label col-md-3' for='PASPORT_GRANT'>_{GRANT}_</label>
                                <div class='col-md-9'>
                                    <textarea class='form-control' id='PASPORT_GRANT' name='PASPORT_GRANT' rows='1'>%PASPORT_GRANT%</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style='padding: 10px'>
                    <div class='form-group'>
                        <label for='GROUP_SEL' class='control-label col-sm-3'>_{USERS}_ _{GROUPS}_:</label>
                        <div class='col-md-9'>
                            %GROUP_SEL%
                        </div>
                    </div>

                    <div class='form-group'>
                        <label for='DOMAIN_ID' class='control-label col-sm-3'>Domain:</label>
                        <div class='col-md-9'>
                            %DOMAIN_SEL%
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='col-md-12'>_{COMMENTS}_</label>
                        <div class='col-md-12'>
                            <textarea cols='30' rows='4' name='COMMENTS' class='form-control'>%COMMENTS%</textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class='col-md-6'>
            <div class='box box-theme'>
                <div class='box-header with-border' class='center'>
                    <h3 class="box-title">_{OTHER}_</h3>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-default btn-xs" data-widget="collapse"><i class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>

                <div id='_other' class='box-collapse box-body'>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='INN'>_{INN}_:</label>
                        <div class='col-md-9'>
                            <input id='INN' name='INN' value='%INN%' placeholder='%INN%' class='form-control'
                                   type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='BIRTHDAY'>_{BIRTHDAY}_:</label>
                        <div class='col-md-9'>
                            <input id='BIRTHDAY' name='BIRTHDAY' value='%BIRTHDAY%' placeholder='%BIRTHDAY%'
                                   class='form-control datepicker' type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='MAX_ROWS'>_{MAX_ROWS}_:</label>
                        <div class='col-md-9'>
                            <input id='MAX_ROWS' name='MAX_ROWS' value='%MAX_ROWS%' placeholder='%MAX_ROWS%'
                                   class='form-control' type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='MIN_SEARCH_CHARS'>_{MIN_SEARCH_CHARS}_:</label>
                        <div class='col-md-9'>
                            <input id='MIN_SEARCH_CHARS' name='MIN_SEARCH_CHARS' value='%MIN_SEARCH_CHARS%'
                                   placeholder='%MIN_SEARCH_CHARS%' class='form-control' type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='MAX_CREDIT'>_{MAX}_ _{CREDIT}_:</label>
                        <div class='col-md-9'>
                            <input id='MAX_CREDIT' name='MAX_CREDIT' value='%MAX_CREDIT%' placeholder='%MAX_CREDIT%'
                                   class='form-control' type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='CREDIT_DAYS'>_{MAX}_ _{CREDIT}_ _{DAYS}_
                            :</label>
                        <div class='col-md-9'>
                            <input id='CREDIT_DAYS' name='CREDIT_DAYS' value='%CREDIT_DAYS%'
                                   placeholder='%CREDIT_DAYS%'
                                   class='form-control' type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='FULL_LOG'>Paranoid _{LOG}_:</label>
                        <div class='col-md-9'>
                            <input id='FULL_LOG' name='FULL_LOG' value='1' %FULL_LOG% type='checkbox'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='SIP_NUMBER'>SIP _{PHONE}_:</label>
                        <div class='col-md-9'>
                            <input id='SIP_NUMBER' name='SIP_NUMBER' value='%SIP_NUMBER%' class='form-control'
                                   type='text'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='API_KEY'>API_KEY:</label>
                        <div class='col-md-9'>
                            <input id='API_KEY' name='API_KEY' value='%API_KEY%' type='text' class='form-control'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='API_KEY'>Telegram ID:</label>
                        <div class='col-md-9'>
                            <input id='TELEGRAM_ID' name='TELEGRAM_ID' value='%TELEGRAM_ID%' type='text' class='form-control'>
                        </div>
                    </div>

                    <div class='form-group'>
                        <label class='control-label col-md-3' for='API_KEY'>GPS IMEI:</label>
                        <div class='col-md-9'>
                            <input id='gps_imei' name='GPS_IMEI' value='%GPS_IMEI%' type='text'
                                   class='form-control'>
                        </div>
                        <div class='col-md-1'>
                            %GPS_ROUTE_BTN%
                        </div>
                        <div class='col-md-1'>
                            %GPS_ICON_BTN%
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class='col-xs-12'>
            <input type=submit name=%ACTION% value='%LNG_ACTION%' ID='submitbutton' class='btn btn-primary'>
        </div>
    </fieldset>
</form>

