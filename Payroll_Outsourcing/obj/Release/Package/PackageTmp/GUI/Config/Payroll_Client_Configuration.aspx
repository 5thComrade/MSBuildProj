<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Config/Payroll_Config.master" AutoEventWireup="true" CodeBehind="Payroll_Client_Configuration.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Config.Payroll_Client_Configuration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $('#ddlrolestoenable').select2();
            $('#ddllogindisable').select2();
            $('#ddlthemefont').select2();
            Load_AllDropDown();
            EnableDisable_Controls();            
            
        });

        function Load_AllDropDown() {
            Bind_ApplicableOption();
            Bind_ApplicableReports();
            Bind_LoanType();
            Bind_LoanInterestRate();
            Bind_PayslipType();
            Bind_PayslipColumns();
            Bind_PayslipPass_Parameter();
            Bind_ITSheet_Format();
            Bind_ITSheet_PassParameter();
            Bind_CTC_Type();
            Bind_CTC_PayFrequency();
        }

        function Bind_ApplicableOption() {
            $('[id$=ddllettersapplicable]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/BindLettersApllicableOption",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddllettersapplicable]').append('<option value="' + data.d[i].LTM_Value + '">'
                                + data.d[i].LTM_Name + '</option>');
                        }
                        $("#ddllettersapplicable").select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load letters applicable.");
                }
            });
        }

        function Bind_ApplicableReports() {
            $('[id$=ddlreport]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetSpecific_Reports",
                data: "{ReportType:'Applicable'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlreport]').append('<option value="' + data.d[i].PR_ID + '">'
                                + data.d[i].PR_NAME + '</option>');
                        }
                        $('#ddlreport').select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load applicable reports.");
                }
            });
        }

        function Bind_LoanType() {
            $('[id$=ddlloantype]').empty();
            $('[id$=ddlloantype]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'LoanType'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlloantype]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlloantype]').select2();
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to load loan type.');
                }
            });
        }

        function Bind_LoanInterestRate() {
            $('[id$=ddlloaninterest]').empty();
            $('[id$=ddlloaninterest]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'LoanInterestRate'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlloaninterest]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlloaninterest]').select2();
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to load loan interest.');
                }
            });
        }

        function Bind_PayslipType() {
            $('[id$=ddlpaysliptype]').empty();
            $('[id$=ddlpaysliptype]').append('<option value="-1">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PayslipType'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlpaysliptype]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlpaysliptype]').select2();
                    }

                },
                failure: function (response) {
                    notify_e("Error", "Unable to load Payslip type.");
                }
            });
        }

        function Bind_PayslipColumns() {
            $('[id$=ddlpayslipcolums]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/BindLettersApllicableOption",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlpayslipcolums]').append('<option value="' + data.d[i].LTM_Value + '">'
                                + data.d[i].LTM_Name + '</option>');
                        }
                        $("#ddlpayslipcolums").select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load payslip columns.");
                }
            });
        }

        function Bind_PayslipPass_Parameter() {
            $('[id$=ddlPayslippasswordparameter]').empty();
            $('[id$=ddlPayslippasswordparameter]').append('<option value="-1">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PasswordParameter'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlPayslippasswordparameter]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlPayslippasswordparameter]').select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load Payslip password parameter.");
                }
            });
        }

        function Bind_ITSheet_Format() {
            $('[id$=ddlitsheetformat]').empty();
            $('[id$=ddlitsheetformat]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'ITSheet'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlitsheetformat]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlitsheetformat]').select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load IT sheet format.");
                }
            });
        }

        function Bind_ITSheet_PassParameter() {
            $('[id$=ddlitsheetpassparameter]').empty();
            $('[id$=ddlitsheetpassparameter]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PasswordParameter'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlitsheetpassparameter]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlitsheetpassparameter]').select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load IT sheet password parameter.");
                }
            });
        }

        function EnableDisable_Controls() {
            $("#txtemplength").prop("disabled", true);
            $("#txtempformat").prop("disabled", true);
            $("#txtempstartno").prop("disabled", true);

            $("#ddllettersapplicable").prop("disabled", true);

            $("#txtloaninterest").prop("disabled", true);
            $('#ddlloantype').prop("disabled", true);
            $("#ddlloaninterest").prop("disabled", true);

            $('#ddlpaysliptype').prop('disabled', true);
            $("#ddlpayslipcolums").prop("disabled", true);

            $('#ddlPayslippasswordparameter').prop('disabled', true);

            $('#ddlitsheetpassparameter').prop('disabled', true);

            $('#cbAutoEmpNo').change(function () {
                if (this.checked) {
                    $("#txtemplength").prop("disabled", false);
                    $("#txtempformat").prop("disabled", false);
                    $("#txtempstartno").prop("disabled", false);
                }
                else {
                    $("#txtemplength").prop("disabled", true);
                    $("#txtempformat").prop("disabled", true);
                    $("#txtempstartno").prop("disabled", true);
                }
            });

            $('#cblettersapplicable').change(function () {
                if (this.checked) {
                    $("#ddllettersapplicable").select2('enable');
                }
                else {
                    $("#ddllettersapplicable").select2('disable');
                }
            });

            $('#cbloanmodule').change(function () {
                if (this.checked) {
                    $("#txtloaninterest").prop("disabled", false);
                    $('#ddlloantype').select2('enable');
                    $("#ddlloaninterest").select2('enable');
                }
                else {
                    $("#txtloaninterest").prop("disabled", true);
                    $('#ddlloantype').select2('disable');
                    $("#ddlloaninterest").select2('disable');
                }
            });

            $('input[type="radio"]').click(function () {
                if ($(this).attr('id') == 'rbcustom') {
                    $('#ddlpaysliptype').select2('enable');
                    $("#ddlpayslipcolums").select2('enable');
                }
                else {
                    $('#ddlpaysliptype').select2('disable');
                    $("#ddlpayslipcolums").select2('disable');
                }
            });

            $('#cbpassprotectpayslip').change(function () {
                if (this.checked) {
                    $('#ddlPayslippasswordparameter').select2('enable');
                }
                else {
                    $('#ddlPayslippasswordparameter').select2('disable');
                }
            });

            $('#cbpasswordprotectitsheet').change(function () {
                if (this.checked) {
                    $('#ddlitsheetpassparameter').select2('enable');
                }
                else {
                    $('#ddlitsheetpassparameter').select2('disable');
                }
            });
        }

        function Bind_CTC_Type() {
            $('[id$=ddlctctype]').empty();
            $('[id$=ddlctctype]').append('<option value="-1">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Component_Type'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlctctype]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlctctype]').select2();
                    }

                },
                failure: function (response) {
                    notify_e("Error", "Unable to load CTC Type.");
                }
            });
        }

        function Bind_CTC_PayFrequency() {
            $('[id$=ddlpayfrequency]').empty();
            $('[id$=ddlpayfrequency]').append('<option value="-1">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PayFrequency'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlpayfrequency]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlpayfrequency]').select2();
                    }

                },
                failure: function (response) {
                    notify_e("Error", "Unable to load CTC Pay frequency.");
                }
            });
        }

    </script>


    <div class="workplace">        
        <div class="row">
            <div class="col-md-12">
                <div class="head clearfix">
                    <div class="isw-settings"></div>
                    <h1>Client Configuration</h1>
                </div>
                <div class="block-fluid accordion" id="accordion">
                    <h3>Basic</h3>
                    <div id="BasicSetup" style="overflow-x: hidden; overflow-y: hidden;">
                        <div class="item">
                            <b style="margin-left: 12px;">Basic Setup</b>
                        </div>
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-2">Auto Employee No:</div>
                                <div class="col-md-1">
                                    <input type="checkbox" id="cbAutoEmpNo" name="cbAutoemp" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">Employee Format:</div>
                                <div class="col-md-1">Length:</div>
                                <div class="col-md-2">
                                    <input name="empno_length" id="txtemplength" type="text" placeholder="Length:4-15" maxlength="15" onkeypress="return ValidateCharacters(8);" />
                                </div>
                                <div class="col-md-1">Ex:</div>
                                <div class="col-md-2">
                                    <input name="empno_format" id="txtempformat" type="text" placeholder="Ex:T1001" />
                                </div>
                                <div class="col-md-2">Start From:</div>
                                <div class="col-md-2">
                                    <input name="empstart_no" id="txtempstartno" type="text" placeholder="Start from:1000"  onkeypress="return ValidateCharacters(8);" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Letters Applicable:</div>
                                <div class="col-md-1">
                                    <input type="checkbox" id="cblettersapplicable" name="cbletters" />
                                </div>
                                <div class="col-md-3">Applicable Options:</div>
                                <div class="col-md-6">
                                    <select name="select" id="ddllettersapplicable" style="width: 100%;" multiple="multiple">
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">PF Capping:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbpfcapping' name="cbpfcaping" />
                                </div>
                                <div class="col-md-3">Applicable Reports:</div>
                                <div class="col-md-6">
                                    <select name="select" id="ddlreport" style="width: 100%;" multiple="multiple">
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Loan Module:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbloanmodule' name="cbloan" />
                                </div>

                                <div class="col-md-3">Process From Contract From:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbprocessfromcontract' name="cbprocessfrom" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Loan Description:</div>
                                <div class="col-md-1">Interest:</div>
                                <div class="col-md-2">
                                    <select name="loaninterest" id="ddlloaninterest" style="width: 100%;">
                                    </select>
                                </div>
                                <div class="col-md-1">Type:</div>
                                <div class="col-md-2">
                                    <select name="loantype" id="ddlloantype" style="width: 100%;">
                                    </select>
                                </div>
                                <div class="col-md-2">Rate Of Interest:</div>
                                <div class="col-md-2">
                                    <input name="loaninterest" id="txtloaninterest" type="text" />
                                </div>
                            </div>

                        </div>
                    </div>
                    <h3>Payroll</h3>
                    <div id="PayrollSetup" style="overflow-x: hidden; overflow-y: hidden;">
                        <div class="item">
                            <b style="margin-left: 12px;">Applicable Pay Codes Setup</b>
                        </div>
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="block-fluid tabs">
                                        <ul>
                                            <li><a href="#tabs-1">CTC</a></li>
                                            <li><a href="#tabs-2">FBP</a></li>
                                            <li><a href="#tabs-3">Expense Reimbursement</a></li>
                                            <li><a href="#tabs-3">Earnings</a></li>
                                            <li><a href="#tabs-3">Perquisites</a></li>
                                        </ul>

                                        <div id="tabs-1">
                                            <div class="item">
                                                <b style="margin-left: 12px;">CTC</b>
                                            </div>
                                            <div class="row-form clearfix">
                                                <div class="row">
                                                    <div class="col-md-2">Paycode:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtpaycode" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Name:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtctcname" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Display Name:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtdisplayname" type="text" />
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Display Order:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtdisplayorder" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Group:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtgroup" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Type:</div>
                                                    <div class="col-md-2">
                                                        <select id="ddlctctype" name="ctc[]" style="width: 100%">
                                                        </select>
                                                    </div>

                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Pay Months:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtpaymonths" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Taxation Type:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txttaxationtype" type="text" />
                                                    </div>
                                                    <div class="col-md-2">Pay Frequency:</div>
                                                    <div class="col-md-2">
                                                        <select id="ddlpayfrequency" name="ctc[]" style="width: 100%">
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Deduction Type:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtdeductiontype" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Formula:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtformula" type="text" />
                                                    </div>
                                                    <div class="col-md-2">Formula 2:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtformula2" type="text" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Exemption Group:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtexemptiongroup" type="text" />
                                                    </div>

                                                    <div class="col-md-2">Exemption Code:</div>
                                                    <div class="col-md-2">
                                                        <input name="ctc[]" id="txtexemptioncode" type="text" />
                                                    </div>
                                                    <div class="col-md-2">Display Payslip:</div>
                                                    <div class="col-md-1">
                                                        <input type='checkbox' id='cbdisplaypayslip' name="ctc[]" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Display IT Sheet:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbdisplayitsheet' name="ctc[]" />
                                                    </div>

                                                    <div class="col-md-2">Appl Payroll:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbaappayroll' name="ctc[]" />
                                                    </div>
                                                    <div class="col-md-2">Appl IT:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapplit' name="ctc[]" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Appl PF:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapplpf' name="ctc[]" />
                                                    </div>

                                                    <div class="col-md-2">Appl PT:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapplpt' name="ctc[]" />
                                                    </div>
                                                    <div class="col-md-2">Appl ESI:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapplesi' name="ctc[]" />
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-2">Appl LWF:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapplwf' name="ctc[]" />
                                                    </div>

                                                    <div class="col-md-2">Appl Proration:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbapppro' name="ctc[]" />
                                                    </div>
                                                    <div class="col-md-2">Accural:</div>
                                                    <div class="col-md-2">
                                                        <input type='checkbox' id='cbaccral' name="ctc[]" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="tabs-2">
                                            <p>
                                                Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet
                                purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor
                                velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In
                                suscipit faucibus urna.
                               
                                            </p>
                                        </div>

                                        <div id="tabs-3">
                                            <p>
                                                Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis.
                                Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero
                                ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis
                                lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.
                               
                                            </p>
                                            <ul>
                                                <li>List item one</li>
                                                <li>List item two</li>
                                                <li>List item three</li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <h3>Portal</h3>
                    <div id="PortalSetup" style="overflow-x: hidden; overflow-y: hidden;">
                        <div class="item">
                            <b style="margin-left: 12px;">Portal Setup</b>
                        </div>
                        <div class="row-form clearfix">

                            <div class="row">
                                <div class="col-md-2">Self Service Module:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbselfservice' name="cbself" />
                                </div>
                                <div class="col-md-2">ESS Portal:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbessportal' name="cbess" />
                                </div>
                                <div class="col-md-3">Employee Master Basic:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbempmasterbasic' name="cbempmaster" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Exit Interview Process:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbexitinterviewprocess' name="cbexitinterview" />
                                </div>
                                <div class="col-md-2">Expense Module:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbexpensemodule' name="cbexpense" />
                                </div>
                                <div class="col-md-3">Employee On Board and Exit:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbempboardexit' name="ebempboard" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Flexi Benefits:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbfb' name="cbflexibenefits" />
                                </div>
                                <div class="col-md-2">Travel Expense:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbtraveexpense' name="cbtravelexp" />
                                </div>
                                <div class="col-md-3">Performance Appraisials:</div>
                                <div class="col-md-1">
                                    <input type='checkbox' id='cbperformanceapprisial' name="cbperformanceApp" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Name To Display:</div>
                                <div class="col-md-2">
                                    <input name="nametodisplay" id="txtnametodisplay" type="text" />
                                </div>
                                <div class="col-md-2">Theme Color-Header:</div>
                                <div class="col-md-2">
                                    <input name="themecolorheader" id="txtthemecolor" type="text" />
                                </div>
                                <div class="col-md-2">Theme Color-Pages:</div>
                                <div class="col-md-2">
                                    <input name="themecolorpage" id="txtthemecolorpage" type="text" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Roles To Enable:</div>
                                <div class="col-md-6">
                                    <select id="ddlrolestoenable" name="roleenable" multiple="multiple" style="width: 100%">
                                        <option value="1001">Admin Manager</option>
                                        <option value="1002">Employee</option>
                                        <option value="1003">Guest</option>
                                        <option value="1004">HR Manager </option>
                                        <option value="1005">HR Spoc </option>
                                        <option value="1006">Input Manager </option>
                                        <option value="1007">Reporting Manager </option>
                                        <option value="1008">Payroll Manager </option>
                                    </select>
                                </div>
                                <div class="col-md-2">Theme Font:</div>
                                <div class="col-md-2">
                                    <select id="ddlthemefont" name="themefont" style="width: 100%">
                                        <option value="0">Select</option>
                                        <option value="1">Times New Roman</option>
                                        <option value="2">Verdana</option>
                                        <option value="3">Arial</option>
                                        <option value="4">Thoma</option>
                                        <option value="5">Calibri</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-2">Login To Disable:</div>
                                <div class="col-md-6">
                                    <select id="ddllogindisable" name="logindisable" multiple="multiple" style="width: 100%">
                                        <option value="1001">Admin Manager</option>
                                        <option value="1002">Employee</option>
                                        <option value="1003">Guest</option>
                                        <option value="1004">HR Manager </option>
                                        <option value="1005">HR Spoc </option>
                                        <option value="1006">Input Manager </option>
                                        <option value="1007">Reporting Manager </option>
                                        <option value="1008">Payroll Manager </option>
                                    </select>
                                </div>

                            </div>

                        </div>

                        <div class="item">
                            <b style="margin-left: 12px;">Declartaion</b>
                        </div>
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-2">EPSF:</div>
                                <div class="col-md-2">EPSF From:</div>
                                <div class="col-md-2">
                                    <input name="epsffrom" id="txtepsffrom" type="text" maxlength="2" onkeypress="return ValidateCharacters(8);" />
                                </div>
                                <div class="col-md-2">EPSF To:</div>
                                <div class="col-md-2">
                                    <input name="epsfto" id="txtepsftoday" type="text" maxlength="2"  onkeypress="return ValidateCharacters(8);" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">FBP:</div>
                                <div class="col-md-2">FBP From:</div>
                                <div class="col-md-2">
                                    <input name="fbpfrom" id="txtfbpfromday" type="text" maxlength="2" />
                                </div>
                                <div class="col-md-2">FBP To:</div>
                                <div class="col-md-2">
                                    <input name="fbpto" id="txtfbpto" type="text" maxlength="2"  onkeypress="return ValidateCharacters(8);" />
                                </div>
                            </div>

                        </div>

                        <div class="item">
                            <b style="margin-left: 12px;">Payslip</b>
                        </div>
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-3">Payslip Format:</div>
                                <div class="col-md-3">
                                    <label class="checkbox checkbox-inline">
                                        <input type="radio" id="rbdefault" value="D" name="rbpayslipformat" checked="checked" />Default                                   
                                    </label>
                                    <label class="checkbox checkbox-inline">
                                        <input type="radio" id="rbcustom" value="C" name="rbpayslipformat" />Custom                                   
                                    </label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Payslip Type:</div>
                                <div class="col-md-3">
                                    <select id="ddlpaysliptype" name="paysliptype" style="width: 100%">
                                    </select>
                                </div>
                                <div class="col-md-3">Payslip Columns:</div>
                                <div class="col-md-3">
                                    <select name="payslipcolumns" id="ddlpayslipcolums" style="width: 100%;" multiple="multiple">
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Password Protect Payslip:</div>
                                <div class="col-md-3">
                                    <input type='checkbox' id='cbpassprotectpayslip' name="cbpasspayslip" />
                                </div>
                                <div class="col-md-3">Password Parameter:</div>
                                <div class="col-md-3">
                                    <select id="ddlPayslippasswordparameter" name="passwordparameter" style="width: 100%">
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <b style="margin-left: 12px;">IT Sheet</b>
                        </div>
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-3">IT Sheet Format:</div>
                                <div class="col-md-3">
                                    <select id="ddlitsheetformat" name="itsheetformat" style="width: 100%">
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3">Password Protect IT Sheet:</div>
                                <div class="col-md-3">
                                    <input type='checkbox' id='cbpasswordprotectitsheet' name="cbpassitsheet" />
                                </div>
                                <div class="col-md-3">Password Parameter:</div>
                                <div class="col-md-3">
                                    <select id="ddlitsheetpassparameter" name="itsheetpassparameter" style="width: 100%">
                                    </select>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-12">
                                    <button type="button" id="btnSave_Configuration" class="btn btn-success pull-right" onclick="return false;">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
