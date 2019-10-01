<%@ Page Title="PAYROLL - Employee Details" Language="C#" MasterPageFile="~/GUI/Employee/Payroll_Employee.master" AutoEventWireup="true" CodeBehind="Payroll_Employee_Details.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Employee.Payroll_Employee_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <style></style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#EmpErrorDetails').hide();
            BindClient();
            Load_DateTime_picker();
            BindEmpMasterTable();
            gridExportBind();
            EventCallAddEmp();
            $('#AddEmp').hide();
            EventGoBack();
            AddRow();
            DeleteRow();
            GetJobType();
            BindPayMode();
            GetCommonLookupValues();
            Validate_EmployeeBasicDetails();
            Validate_EmployeeEducationDetails();
            Btn_Education_PreviousClick();
            Btn_Official_Previous_Click();
            $($("#accordion > h3")[1]).addClass("ui-state-disabled"); $('#EducationDetails').hide();
            $($("#accordion > h3")[2]).addClass("ui-state-disabled"); $('#OfficialDetails').hide();
            GetBankDetails();
            SaveEmployeeDetails();
            ShowHide_Div_Controls();
            dvPresentAddress();
            dvPermanentAddress();
            dvMailingAddress();
            EmpProfile_DetailsUpdate();
            Primary_DetailsUpdate();
            PresentAdressUpdate();
            PermanentAdressUpdate();
            MailingAdressUpdate();
            Work_DetailsUpdate();
            Save_EducationDetails();
            EduactionDetailsUpdate();
            Official_DetailsUpdate();
            Bank_DetailsUpdate();
        });

        function ShowHide_Div_Controls() {
            // $('#contentOperation').hide();
            $('#EmployeeView').hide();
            $('.txtview').hide();
            $('.txtWorkview').hide();
            $('#Personal_PrimarySave').hide();
            $('#Personal_PrimaryCancel').hide();
            $('#Personal_Contact_Edit').hide();
            $('#Contact_Back').hide();
            $('#PresentAddressControls').hide();
            $('#PermanentAddressControls').hide();
            $('#MailingAddressControls').hide();
            $('.txtpresent').hide();
            $('#BtnContactCancel').hide();
            $('#BtnContactSave').hide();
            $('#btn_PermanentSave').hide();
            $('#btn_MailingSave').hide();
            $('.txtpermanent').hide();
            $('.txtmailing').hide();
            $('.txtofficebank').hide();
            $('.txtbank').hide();
            $('#btn_EducationEdit').hide();
            $('#Btn_WorkExp_Save').hide();
            $('#Btn_WorkExp_Cancel').hide();
            $('#Btn_Office_Save').hide();
            $('#Btn_Office_Cancel').hide();
            $('#Btn_Bank_Save').hide();
            $('#Btn_Bank_Cancel').hide();
            $('#btn_GeneralDetails_Save').hide();
            $('#btn_GeneralDetails_Cancel').hide();
            $('#Emp_GeneralDetailsEdit').hide();
            $('#dvEducationEdit').hide();
            $('#btn_Education_Cancel').hide();
            $('#btn_Education_Save').hide();
            $('#btn_EducationEmptyCancel').hide();
            $('#btn_EducationEmptySave').hide();
            BindEdit_saluation();
            BindEdit_jobtype();
            Bind_EditPayMode();
        }

        function Load_DateTime_picker() {
            $('#txtdob').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });
            $('#txtpervdoj').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

            $('#txtprevdol').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

            $('#txtoff_doj').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

            $('#txtoff_dol').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

            $('#txtEditEmpDob').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

            $('#txtwork_DOJ').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });
            $('#txtwork_DOL').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });
            $('#txtoff_Editdoj').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });
            $('#txtoff_Editdol').datetimepicker({
                lang: 'ch',
                timepicker: false,
                format: 'd-m-Y',
                formatDate: 'd-m-Y',
                scrollInput: false
            });

        }

        function EventCallAddEmp() {

            $('#CallAddEmp').click(function () {
                $('#GridEmp').hide();
                $('#AddEmp').show();
            });
        }

        function EventGoBack() {
            $('#GoBack').click(function () {
                $('#GridEmp').show();
                $('#AddEmp').hide();
            });
        }

        function Employee_Home() {
            $('#GridEmp').show();
            $('#AddEmp').hide();
        }

        function BindEmpMasterTable() {
            $('#spGridEmp').show();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/BindEmpMasterTable",
                data: "{ClientID:'00FBG'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        $('#divgrid').w2grid({
                            name: 'grid',
                            method: 'GET',
                            columns: [
                                { field: 'Emp_No', caption: 'Employee Number', size: '30%', sortable: true },
                                { field: 'Emp_Name', caption: 'Employee Name', size: '30%', sortable: true },
                                { field: 'Client_ID', caption: 'Client ID', size: '40%', sortable: true },
                                { field: 'Mob_No', caption: 'Mobile Number', size: '30%', sortable: true },
                                { field: 'DOB', caption: 'Date of Birth', size: '30%', sortable: true },
                                { field: 'Gender', caption: 'Gender', size: '30%', sortable: true },
                                { field: 'EmailID', caption: 'Email ID', size: '30%', sortable: true },
                                { field: 'Address', caption: 'Address', size: '30%', sortable: true },
                                { field: 'Status', caption: 'Status', size: '30%', sortable: true },
                            ],
                            searches: [
                                { type: 'text', field: 'Emp_No', caption: 'Employee Number' },
                                { type: 'text', field: 'Emp_Name', caption: 'Employee Name' },
                                { type: 'date', field: 'DOB', caption: 'Date of Birth' }
                            ],
                            //onExpand: function (event) {
                            //    $('#' + event.box_id).html('<div style="padding: 10px">Expanded content</div>').animate({ 'height': 100 }, 100);
                            //},
                            show: {
                                toolbar: true,
                                footer: true,
                                lineNumbers: true,
                                selectColumn: false,
                                expandColumn: false
                            },
                            records: JSON.parse(data.d)
                        });
                        w2ui['grid'].autoLoad = true;

                        var myObject = data.d;
                        myObject = myObject.replace(/(<([^>]+)>)/ig, "")
                        $('#dvExport').text(myObject);
                    }
                    $('#spGridEmp').hide();
                },
                failure: function (response) {
                    notify_e("Error", "Error while loading employee details.");
                    $('#spGridEmp').hide();
                }
            });

        }

        function AddRow() {
            $('#addnewrow').click(function (event) {

                $("#tbleducation").each(function () {
                    var tds = '<tr>';
                    jQuery.each($('tr:last td', this), function () {

                        tds += '<td>' + $(this).html() + '</td>';
                    });
                    tds += '</tr>';
                    if ($('tbody', this).length > 0) {
                        $('tbody', this).append(tds);
                        //document.getElementById('divedu').style.height = "auto";
                    } else {
                        $(this).append(tds);
                    }

                });


            });


        }

        function DeleteRow() {
            $("#deleterow").click(function (event) {
                var rowCount = $('#tbleducation > tbody > tr').length;
                if (rowCount > 1) {
                    $('#tbleducation tr:last').remove();
                }
                else if (rowCount == 1) {
                    var $tds = $('#tbleducation').find('td');
                    $($tds[0]).find('input').val('');
                    $($tds[1]).find('input').val('');
                    $($tds[2]).find('input').val('');
                    $($tds[3]).find('input').val('');
                    $("#deleterow").attr("disabled", "disabled");
                    return false;
                }
                else {
                    location.reload();
                }
            });
        }

        function GetJobType() {
            $('[id$=ddljobtype]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'JobType'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=ddljobtype]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=ddljobtype]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=ddljobtype]').select2();
                    }
                },
                failure: function (response) {
                }
            });

        }

        function BindClient() {
            $('[id$=ddlclient]').empty();
            $('[id$=ddlclient]').append('<option value="0">Choose Client</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetClient",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlclient]').append('<option value="' + data.d[i].PCM_ID + '">' + data.d[i].PCM_ID + '/' + data.d[i].PCM_NAME + '</option>');
                        }
                        $("#ddlclient").prop("selectedIndex", 0);
                        $('[id$=ddlclient]').select2();
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to load client.');
                }
            });
        }

        function BindPayMode() {
            $('[id$=ddlpaymentmode]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PaymentMode'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=ddlpaymentmode]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=ddlpaymentmode]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=ddlpaymentmode]').select2();
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load paymode.");
                }
            });
        }

        var EmployeeMasterHeader = [
                      {
                          SlNo: "", EmployeeNo: "", ClientID: "", DateOfBirth: "", Gender: "", Saluation: "", EmployeeName: "", Email: "", MobileNo: "", PresentAddress: "",
                          PresentCity: "", PresentState: "", PresentPincode: "", PresentCountry: "", Nationality: "", JobType: "", PermanentAddress: "", PermanentCity: "",
                          PermanentState: "", PermanentPincode: "", PermanentCountry: "", PermanentNationality: "", PreviousExperience: "", PreviousCompany: "", PreviousDesignation: "",
                          PreviousDateOfJoining: "", PreviousDateOfLeaving: "", HighestQualification: "", YearOfPassing: "", Percentage: "", InstituteName: "", OfficialDateOfJoining: "",
                          OfficialDateOfLeaving: "", CurrentDesignation: "", Department: "", CostCenter: "", Branch: "", PONumber: "", Category: "", JobLocation: "", PTState: "",
                          ESIContribution: "", PFContribution: "", PFCapping: "", Handicap: "", SeniorCitizen: "", PFUANNumber: "", ESINumber: "", AadharNumber: "", PAN: "", PassportNumber: "",
                          DrivingLicenseNumber: "", OfficeAddress: "", OfficeCity: "", OfficeState: "", OfficePincode: "", OfficeCountry: "", Paymode: "", Bank: "", BankBranch: "", AccountNumber: "",
                          IFSCCode: ""
                      }
        ];

        var MandatoryEmployeeMasterHeader = [
       {
           SlNo: "", EmployeeNo: "", ClientID: "", DateOfBirth: "", Gender: "", Saluation: "", EmployeeName: "", JobType: "", OfficialDateOfJoining: "",
           OfficialDateOfLeaving: "", CurrentDesignation: "", Department: "", JobLocation: "", PTState: "", ESIContribution: "", PFContribution: "",
           PFCapping: "", Handicap: "", SeniorCitizen: ""
       }];

        function DownloadBlankTemplate() {
            var data, filename, link;
            var csv = convertArrayOfObjectsToCSV({
                data: EmployeeMasterHeader
            });
            if (csv == null) return;
            filename = 'EmployeeInformation.csv';
            if (!csv.match(/^data:text\/csv/i)) {
                csv = 'data:text/csv;charset=utf-8,' + csv;
            }
            data = encodeURI(csv);
            link = document.createElement('a');
            link.setAttribute('href', data);
            link.setAttribute('download', filename);
            link.click();
        }

        function DownloadMandatoryTemplate() {
            var data, filename, link;
            var csv = convertArrayOfObjectsToCSV({
                data: MandatoryEmployeeMasterHeader
            });
            if (csv == null) return;
            filename = 'MandatoryEmployeeInformation.csv';
            if (!csv.match(/^data:text\/csv/i)) {
                csv = 'data:text/csv;charset=utf-8,' + csv;
            }
            data = encodeURI(csv);
            link = document.createElement('a');
            link.setAttribute('href', data);
            link.setAttribute('download', filename);
            link.click();
        }

        function convertArrayOfObjectsToCSV(args) {
            var result, ctr, keys, columnDelimiter, lineDelimiter, data;
            data = args.data || null;
            if (data == null || !data.length) {
                return null;
            }
            columnDelimiter = args.columnDelimiter || ',';
            lineDelimiter = args.lineDelimiter || '\n';
            keys = Object.keys(data[0]);
            result = '';
            result += keys.join(columnDelimiter);
            result += lineDelimiter;
            data.forEach(function (item) {
                ctr = 0;
                keys.forEach(function (key) {
                    if (ctr > 0) result += columnDelimiter;
                    result += item[key];
                    ctr++;
                });
                result += lineDelimiter;
            });
            return result;
        }

        function GetCommonLookupValues() {
            $('[id$=ddlsaluation]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Salutation'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=ddlsaluation]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=ddlsaluation]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=ddlsaluation]').select2();
                    }
                },
                failure: function (response) {
                }
            });
        }

        function validateEmail($email) {
            var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            return emailReg.test($email);
        }

        function Btn_Education_PreviousClick() {
            $('#btn_previous').click(function (event) {
                $('#ui-accordion-1-header-1').click();
                $($("#accordion > h3")[1]).removeClass("ui-state-disabled");
                $('#EmployeeDetails').show();
                $('#EducationDetails').hide();
                $('#OfficialDetails').hide();
            });
        }

        function Btn_Official_Previous_Click() {
            $('#btn_Official_previous').click(function (event) {
                $('#ui-accordion-1-header-2').click();
                $($("#accordion > h3")[2]).removeClass("ui-state-disabled");
                $('#EducationDetails').show();
                $('#EmployeeDetails').hide();
                $('#OfficialDetails').hide();
            });
        }

        function Validate_EmployeeBasicDetails() {
            $("#btn_next").click(function (event) {
                var number = $('#txtmobileno').val();
                var getDate = new Date(); //Today Date
                var getYear = getDate.getFullYear();
                var inputDOB = new Date($('#txtdob').val());

                //EMPLOYEE MASTER
                if ($('#txtempno').val() == '') {
                    notify_e('Error', 'Please enter employee no');
                    $('#EmployeeDetails').show();
                    $('#txtempno').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtempname').val() == '') {
                    notify_e('Error', 'Please enter employee name.');
                    $('#EmployeeDetails').show();
                    $('#txtempname').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtemail').val() == '') {
                    notify_e('Error', 'Please enter employee email.');
                    $('#EmployeeDetails').show();
                    $('#txtemail').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if (!validateEmail($('#txtemail').val())) {
                    notify_e('Error', 'Please enter valid email address.');
                    $('#EmployeeDetails').show();
                    $('#txtemail').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtClientID').val() == '') {
                    notify_e('Error', 'Please enter client id.');
                    $('#EmployeeDetails').show();
                    $('#txtClientID').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#ddljobtype option:selected').val() == 0) {
                    notify_e('Error', 'Please select job type.');
                    $('#EmployeeDetails').show();
                    $('#ddljobtype').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtmobileno').val() == '') {
                    notify_e('Error', 'Please enter mobile no.');
                    $('#EmployeeDetails').show();
                    $('#txtmobileno').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if (number.length < 10) {
                    notify_e('Error', 'Please enter 10 digit mobile no.');
                    $('#EmployeeDetails').show();
                    $('#txtmobileno').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#ddlsaluation option:selected').val() == 0) {
                    notify_e('Error', 'Please select saluation.');
                    $('#EmployeeDetails').show();
                    $('#ddlsaluation').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtdob').val() == '') {
                    notify_e('Error', 'Please select date of birth.');
                    $('#EmployeeDetails').show();
                    $('#txtdob').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                    //EMPLOYEE PRESENT ADDRESS
                else if ($('#txtaddress').val() == '') {
                    notify_e('Error', 'Please enter employee present address.');
                    $('#EmployeeDetails').show();
                    $('#txtaddress').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtcity').val() == '') {
                    notify_e('Error', 'Please enter employee present City.');
                    $('#EmployeeDetails').show();
                    $('#txtcity').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtstate').val() == '') {
                    notify_e('Error', 'Please enter employee present state.');
                    $('#EmployeeDetails').show();
                    $('#txtstate').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtpincode').val() == '') {
                    notify_e('Error', 'Please enter employee present pincode.');
                    $('#EmployeeDetails').show();
                    $('#txtpincode').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtcountry').val() == '') {
                    notify_e('Error', 'Please enter employee present country.');
                    $('#EmployeeDetails').show();
                    $('#txtcountry').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtnationality').val() == '') {
                    notify_e('Error', 'Please enter employee present nationality.');
                    $('#EmployeeDetails').show();
                    $('#txtnationality').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }

                    //EMPLOYEE PERMANENET ADDRESS
                else if ($('#txtper_address').val() == '') {
                    notify_e('Error', 'Please enter employee permanent address.');
                    $('#EmployeeDetails').show();
                    $('#txtper_address').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtper_city').val() == '') {
                    notify_e('Error', 'Please enter employee permanent city.');
                    $('#EmployeeDetails').show();
                    $('#txtper_city').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtper_state').val() == '') {
                    notify_e('Error', 'Please enter employee permanent state.');
                    $('#EmployeeDetails').show();
                    $('#txtper_state').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtper_pincode').val() == '') {
                    notify_e('Error', 'Please enter employee permanent pincode.');
                    $('#EmployeeDetails').show();
                    $('#txtper_pincode').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtper_country').val() == '') {
                    notify_e('Error', 'Please enter employee permanent country.');
                    $('#EmployeeDetails').show();
                    $('#txtper_country').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else if ($('#txtper_nationality').val() == '') {
                    notify_e('Error', 'Please enter employee permanent nationality.');
                    $('#EmployeeDetails').show();
                    $('#txtper_nationality').focus();
                    $('#EducationDetails').hide();
                    $('#OfficialDetails').hide();
                    return false;
                }
                else {
                    $('#ui-accordion-1-header-1').click();
                    $($("#accordion > h3")[1]).removeClass("ui-state-disabled");
                    $('#EducationDetails').show();
                    $('#EmployeeDetails').hide();
                    $('#OfficialDetails').hide();
                    return true;
                }
            });
        }

        function Validate_EmployeeEducationDetails() {
            $("#btn_educationNext").click(function (event) {
                $('#tbleducation tr').each(function () {
                    var Quali = $(this).find("input[id='txtqualification']");
                    var Insti = $(this).find("input[id='txtinstituename']");
                    var Yearof = $(this).find("input[id='txtyearofpassing']");
                    var Percentage = $(this).find("input[id='txtpercentage']");

                    if (Quali.val() == '') {
                        notify_e("Error", "Qualification can not be blank.");
                        $('#EducationDetails').show();
                        $('#EmployeeDetails').hide();
                        $('#OfficialDetails').hide();
                        return false;
                    }
                    else if (Insti.val() == '') {
                        notify_e("Error", "Institute name can not be blank.");
                        $('#EducationDetails').show();
                        $('#EmployeeDetails').hide();
                        $('#OfficialDetails').hide();
                        return false;
                    }
                    else if (Yearof.val() == '') {
                        notify_e("Error", "Year of passing can not be blank.");
                        $('#EducationDetails').show();
                        $('#EmployeeDetails').hide();
                        $('#OfficialDetails').hide();
                        return false;
                    }
                    else if (Percentage.val() == '') {
                        notify_e("Error", "Score percentage can not be blank.");
                        $('#ui-accordion-1-header-2').click();
                        $($("#accordion > h3")[2]).removeClass("ui-state-disabled");
                        $('#EducationDetails').show();
                        $('#EmployeeDetails').hide();
                        $('#OfficialDetails').hide();
                        return false;
                    }
                    else {
                        $('#ui-accordion-1-header-2').click();
                        $($("#accordion > h3")[2]).removeClass("ui-state-disabled");
                        $('#OfficialDetails').show();
                        $('#EducationDetails').hide();
                        $('#EmployeeDetails').hide();
                    }
                });

            });
        }

        function ValidateEmployeeOfficial_WorkDetails() {
            if ($('#txtpervcompany').val() == '') {
                notify_e('Error', 'Please enter previous company.');
                $('#OfficialDetails').show();
                $('#txtpervcompany').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtprevdesig').val() == '') {
                notify_e('Error', 'Please enter previous designation.');
                $('#OfficialDetails').show();
                $('#txtprevdesig').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtyearsexp').val() == '') {
                notify_e('Error', 'Please enter previous experience.');
                $('#OfficialDetails').show();
                $('#txtyearsexp').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtpervdoj').val() == '') {
                notify_e('Error', 'Please select previous date of joining.');
                $('#OfficialDetails').show();
                $('#txtpervdoj').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtprevdol').val() == '') {
                notify_e('Error', 'Please select previous date of leaving.');
                $('#OfficialDetails').show();
                $('#txtprevdol').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
                //EMPLOYEE OFFICIAL 
            else if ($('#txtoff_doj').val() == '') {
                notify_e('Error', 'Please select  date of joining.');
                $('#OfficialDetails').show();
                $('#txtoff_doj').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_dol').val() == '') {
                notify_e('Error', 'Please select date of leaving.');
                $('#OfficialDetails').show();
                $('#txtoff_dol').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_designation').val() == '') {
                notify_e('Error', 'Please enter employee designation.');
                $('#OfficialDetails').show();
                $('#txtoff_designation').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_department').val() == '') {
                notify_e('Error', 'Please enter employee department.');
                $('#OfficialDetails').show();
                $('#txtoff_department').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_branch').val() == '') {
                notify_e('Error', 'Please enter branch.');
                $('#OfficialDetails').show();
                $('#txtoff_branch').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_joblocation').val() == '') {
                notify_e('Error', 'Please enter job location.');
                $('#OfficialDetails').show();
                $('#txtoff_joblocation').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_costcenter').val() == '') {
                notify_e('Error', 'Please enter cost center.');
                $('#OfficialDetails').show();
                $('#txtoff_costcenter').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_ponumber').val() == '') {
                notify_e('Error', 'Please enter PO no.');
                $('#OfficialDetails').show();
                $('#txtoff_ponumber').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_category').val() == '') {
                notify_e('Error', 'Please enter category.');
                $('#OfficialDetails').show();
                $('#txtoff_category').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_ptstation').val() == '') {
                notify_e('Error', 'Please enter pt station.');
                $('#OfficialDetails').show();
                $('#txtoff_ptstation').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtoff_pan').val() == '') {
                notify_e('Error', 'Please enter pan no.');
                $('#OfficialDetails').show();
                $('#txtoff_pan').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
                //Employee Bank Details
            else if ($('#txtifsccode').val() == '') {
                notify_e('Error', 'Please enter IFSC code.');
                $('#OfficialDetails').show();
                $('#txtifsccode').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#ddlpaymentmode option:selected').val() == 0) {
                notify_e('Error', 'Please select payment mode.');
                $('#OfficialDetails').show();
                $('#ddlpaymentmode').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtacc_no').val() == '') {
                notify_e('Error', 'Please enter account no.');
                $('#OfficialDetails').show();
                $('#txtacc_no').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtbankname').val() == '') {
                notify_e('Error', 'Please enter bank name.');
                $('#OfficialDetails').show();
                $('#txtbankname').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtbankbranch').val() == '') {
                notify_e('Error', 'Please enter bank branch.');
                $('#OfficialDetails').show();
                $('#txtbankbranch').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }
            else if ($('#txtbankaddress').val() == '') {
                notify_e('Error', 'Please enter bank address.');
                $('#OfficialDetails').show();
                $('#txtbankaddress').focus();
                $('#EmployeeDetails').hide();
                $('#EducationDetails').hide();
                return false;
            }


            else {
                return true;
            }
        }

        function GetBankDetails() {
            $('#GetDetails').click(function (event) {
                if ($('#txtifsccode').val() == '') {
                    notify_e('Error', 'Please enter ifsc code.');
                    $('#txtifsccode').focus();
                    return false;
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "../WebServices/Payroll_Webservices.asmx/APICallBankDetails",
                        data: "{'IFSCCODE': '" + $('#txtifsccode').val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (data) {

                            var json = JSON.parse(data.d);
                            if (json != "Not Found") {
                                $('#txtbankname').val(json["BANK"]);
                                $('#txtbankbranch').val(json["BRANCH"]);
                                $('#txtbankaddress').val(json["ADDRESS"]);
                                $('#spinner').hide();
                            }
                            else {

                                notify_e('Error', 'Invalid  ifsc code.');
                            }
                        },
                        failure: function (response) {
                            notify_e('Error', 'Unable to load bank details.');
                        }
                    });
                }
            });

        }

        function Qualification() {
            var inps = document.getElementsByName('Qualification[]');
            var Qualify = ''
            var j = 0;
            if (inps[0].value != '') {
                Qualify += '<Root>';
                for (var i = 0; i < (inps.length / 4) ; i++) {
                    Qualify += '<Node>';
                    if (j == inps.length) {
                        break;
                    }
                    j = j;
                    Qualify += '<Qualification>' + inps[j].value + '</Qualification>';
                    j = j + 1;
                    Qualify += '<Institute>' + inps[j].value + '</Institute>';
                    j = j + 1;
                    Qualify += '<YearPassing>' + inps[j].value + '</YearPassing>';
                    j = j + 1;
                    Qualify += '<Percentage>' + inps[j].value + '</Percentage>';
                    j = j + 1;
                    Qualify += '</Node>';
                }
                Qualify += '</Root>';
            }
            return Qualify;
        }

        function GetParams() {

            var Gender = (document.getElementById("rbmale").checked) ? Gender = 'M' : Gender = 'F';
            var Pfcapping = (document.getElementById("pfc-ys").checked) ? Pfcapping = 'Y' : Pfcapping = 'N';
            var ESIcontribution = (document.getElementById("erb-ys").checked) ? ESIcontribution = 'Y' : ESIcontribution = 'N';
            var PFcontribution = (document.getElementById("pfrb-ys").checked) ? PFcontribution = 'Y' : PFcontribution = 'N';
            var Handicap = (document.getElementById("hrb-ys").checked) ? Handicap = 'Y' : Handicap = 'N';
            var SeniorCitizen = (document.getElementById("scrb-ys").checked) ? SeniorCitizen = 'Y' : SeniorCitizen = 'N';


            var params =
             //EMPLOYEE BASIC DETAILS
            "{EM_EMP_NO:'" + $('#txtempno').val()
            + "',EM_NAME:'" + $('#txtempname').val()
            + "',EM_EMAIL:'" + $('#txtemail').val()
            + "',EM_CLIENT_ID:'" + $('#txtClientID').val()
            + "',EM_JOB_TYPE:'" + $('#ddljobtype option:selected').val()
            + "',EM_MOBILE:'" + $('#txtmobileno').val()
            + "',EM_TITLE:'" + $('#ddlsaluation option:selected').val()
            + "',EM_DOB:'" + $('#txtdob').val()
            + "',EM_GENDER:'" + Gender
            + "',EM_PRESENT_ADDRESS:'" + $('#txtaddress').val()
            + "',EM_PRESENT_CITY:'" + $('#txtcity').val()
            + "',EM_PRESENT_STATE:'" + $('#txtstate').val()
            + "',EM_NATIONALITY:'" + $('#txtnationality').val()
            + "',EM_PRESENT_COUNTRY:'" + $('#txtcountry').val()
            + "',EM_PRESENT_PINCODE:'" + $('#txtpincode').val()
            //EMPLOYEE ADDRESS
            + "',EA_PERMANENT_ADDRESS:'" + $('#txtper_address').val()
            + "',EA_PERMANENT_CITY:'" + $('#txtper_city').val()
            + "',EA_PERMANENT_STATE:'" + $('#txtper_state').val()
            + "',EA_PERMANENT_NATIONALITY:'" + $('#txtper_nationality').val()
            + "',EA_PERMANENT_COUNTRY:'" + $('#txtper_country').val()
            + "',EA_PERMANENT_PINCODE:'" + $('#txtper_pincode').val()
            //EMPLOYEE MAILING ADDRESS
            + "',EA_MAILING_ADDRESS:'" + $('#txtmail_address').val()
            + "',EA_MAILING_CITY:'" + $('#txtmail_city').val()
            + "',EA_MAILING_STATE:'" + $('#txtmail_state').val()
            + "',EA_MAILING_NATIONALITY:'" + $('#txtmail_nationality').val()
            + "',EA_MAILING_COUNTRY:'" + $('#txtmail_country').val()
            + "',EA_MAILING_PINCODE:'" + $('#txtmail_pincode').val()

            //EMPLOYEE QUALIFICATION
            + "',Qualification:'" + Qualification()
            //EMPLOYEE WORK EXPERIENCE
            + "',EW_PREVCOMPANY:'" + $('#txtpervcompany').val()
            + "',EW_PREVDESIGNATION:'" + $('#txtprevdesig').val()
            + "',EW_PREVEXP:'" + $('#txtyearsexp').val()
            + "',EW_SKILLS:'" + $('#txtskills').val()
            + "',EW_PREVDOJ:'" + $('#txtpervdoj').val()
            + "',EW_PREVDOL:'" + $('#txtprevdol').val()
            //EMPLOYEE OFFICIAL DETAILS
            + "',EO_DOJ:'" + $('#txtoff_doj').val()
            + "',EO_DOL:'" + $('#txtoff_dol').val()
            + "',EO_DESIGNATION:'" + $('#txtoff_designation').val()
            + "',EO_DEPARTMENT:'" + $('#txtoff_department').val()
            + "',EO_BRANCH:'" + $('#txtoff_branch').val()
            + "',EO_JOBLOCATION:'" + $('#txtoff_joblocation').val()
            + "',EO_COST_CENTER:'" + $('#txtoff_costcenter').val()
            + "',EO_PONUMBER:'" + $('#txtoff_ponumber').val()
            + "',EO_CATEGORY:'" + $('#txtoff_category').val()
            + "',EO_PT_STATE:'" + $('#txtoff_ptstation').val()
            + "',EO_ESI_NUMBER:'" + $('#txtoff_esinumber').val()
            + "',EO_AADHAR_NUMBER:'" + $('#txtoff_aadharnum').val()
            + "',EO_PFUAN_NUMBER:'" + $('#txtoff_uannumber').val()
            + "',EO_PASSPORT_NUMBER:'" + $('#txtoff_passportnum').val()
            + "',EO_DRIVERSLICENSE:'" + $('#txtoff_driverslicense').val()
            + "',EO_PAN:'" + $('#txtoff_pan').val()
            + "',EO_PF_CAPPING:'" + Pfcapping
            + "',EO_ESI_CONTRIBUTION:'" + ESIcontribution
            + "',EO_PF_CONTRIBUTION:'" + PFcontribution
            + "',EO_HANDICAP:'" + Handicap
            + "',EO_SENIOR_CITIZEN:'" + SeniorCitizen
            + "',EO_OFFICE_STATE:'" + $('#txtoff_state').val()
            + "',EO_OFFICE_CITY:'" + $('#txtoff_city').val()
            + "',EO_OFFICE_COUNTRY:'" + $('#txtoff_country').val()
            + "',EO_OFFICE_PINCODE:'" + $('#txtoff_pincode').val()
            + "',EO_OFFICE_ADDRESS:'" + $('#txtoff_address').val()
            //EMPLOYEE BANK DETAILS
            + "',EB_IFSC_Code:'" + $('#txtifsccode').val()
            + "',EB_Payment_Mode:'" + $('#ddlpaymentmode option:selected').val()
            + "',EB_Account_Number:'" + $('#txtacc_no').val()
            + "',EB_Bank_Name:'" + $('#txtbankname').val()
            + "',EB_Branch:'" + $('#txtbankbranch').val()
            + "',EB_Address:'" + $('#txtbankaddress').val()
            + "',EM_CREATED_BY:'" + 'ADMIN'
            + "'}";
            return params;
        }

        function EmployeeMasterInformation_Insert() {
            var boolflag = false;
            var parameters = GetParams();
            boolflag = ValidateEmployeeOfficial_WorkDetails();
            if (boolflag == true) {
                $.ajax({
                    type: "POST",
                    url: "../WebServices/Payroll_Webservices.asmx/EmployeeMasterInformation_Insert",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "Success.") {
                            notify_s("Success", "Data uploaded successfully.")
                            ClearControls();
                            Employee_Home();
                        }
                        else {
                            notify_e("Error", data.d);
                        }
                    },
                    failure: function (response) {
                        notify_e("Error", "Error while uploading employee details.");
                    }
                });
            }
            else {
                notify_e("Error", "Error while uploading employee details.");
            }
        }

        function SaveEmployeeDetails() {
            $("#btnsave_employee").click(function (event) {
                EmployeeMasterInformation_Insert();
            });
        }

        function ClearControls() {
            //Employee Details
            $('#txtempno').val('');
            $('#txtemail').val('');
            $('#txtempname').val('');
            $('#txtClientID').val('');
            $('#txtjobtype').val('');
            $('#txtmobileno').val('');
            $('#txtdob').val('');
            $('#ddlsaluation').val('').trigger("chosen:updated");
            //document.getElementById("ProfileImage").src = '';
            $('input:radio[name="rbgender"][value="M"]').prop('checked', true);

            //Present Address Details
            $('#txtaddress').val('');
            $('#txtcity').val('');
            $('#txtstate').val('');
            $('#txtnationality').val('');
            $('#txtcountry').val('');
            $('#txtpincode').val('');

            //Permanent Address
            $('#txtper_address').val('');
            $('#txtper_city').val('');
            $('#txtper_state').val('');
            $('#txtper_nationality').val('');
            $('#txtper_country').val('');
            $('#txtper_pincode').val('');

            //Mailing Address
            $('#txtmail_city').val('');
            $('#txtmail_country').val('');
            $('#txtmail_state').val('');
            $('#txtmail_nationality').val('');
            $('#txtmail_pincode').val('');
            $('#txtmail_address').val('');

            //Work Experience
            $('#txtpervcompany').val('');
            $('#txtprevdesig').val('');
            $('#txtyearsexp').val('');
            $('#txtskills').val('');
            $('#txtpervdoj').val('');
            $('#txtprevdol').val('');

            //Qualification
            $('#txtqualification').val('');
            $('#txtpercentage').val('');
            $('#txtinstituename').val('');
            $('#txtyearofpassing').val('');

            //Official Details
            $('#txtoff_doj').val('');
            $('#txtoff_dol').val('');
            $('#txtoff_designation').val('');
            $('#txtoff_department').val('');
            $('#txtoff_branch').val('');
            $('#txtoff_joblocation').val('');
            $('#txtoff_costcenter').val('');
            $('#txtoff_ponumber').val('');
            $('#txtoff_category').val('');
            $('#txtoff_ptstation').val('');
            $('#txtoff_esinumber').val('');
            $('#txtoff_aadharnum').val('');
            $('#txtoff_uannumber').val('');
            $('#txtoff_passportnum').val('');
            $('#txtoff_driverslicense').val('');
            $('#txtoff_pan').val('');
            $('#txtoff_state').val('');
            $('#txtoff_city').val('');
            $('#txtoff_country').val('');
            $('#txtoff_pincode').val('');
            $('#txtoff_address').val('');
            $('#txtifsccode').val('');
            $('#txtacc_no').val('');
            $('#txtbankname').val('');
            $('#txtbankbranch').val('');
            $('#txtbankaddress').val('');

            $('input:radio[name="rbpfcapping"][value="Y"]').prop('checked', true);
            $('input:radio[name="rbesi"][value="Y"]').prop('checked', true);
            $('input:radio[name="rbpfc"][value="Y"]').prop('checked', true);
            $('input:radio[name="rbhandicap"][value="Y"]').prop('checked', true);
            $('input:radio[name="rbsc"][value="Y"]').prop('checked', true);
        }

        var template = {
            "EmployeeMasterHeader": ["SlNo", "EmployeeNo", "ClientID", "DateOfBirth", "Gender", "Saluation", "EmployeeName", "Email", "MobileNo", "PresentAddress",
            "PresentCity", "PresentState", "PresentPincode", "PresentCountry", "Nationality", "JobType", "PermanentAddress", "PermanentCity",
            "PermanentState", "PermanentPincode", "PermanentCountry", "PermanentNationality", "PreviousExperience", "PreviousCompany", "PreviousDesignation",
            "PreviousDateOfJoining", "PreviousDateOfLeaving", "HighestQualification", "YearOfPassing", "Percentage", "InstituteName", "OfficialDateOfJoining",
            "OfficialDateOfLeaving", "CurrentDesignation", "Department", "CostCenter", "Branch", "PONumber", "Category", "JobLocation", "PTState",
            "ESIContribution", "PFContribution", "PFCapping", "Handicap", "SeniorCitizen", "PFUANNumber", "ESINumber", "AadharNumber", "PAN", "PassportNumber",
            "DrivingLicenseNumber", "OfficeAddress", "OfficeCity", "OfficeState", "OfficePincode", "OfficeCountry", "Paymode", "Bank", "BankBranch", "AccountNumber",
            "IFSCCode"],

            "MandatoryEmployeeMasterHeader": ["SlNo", "EmployeeNo", "ClientID", "DateOfBirth", "Gender", "Saluation", "EmployeeName", "JobType", "OfficialDateOfJoining",
            "OfficialDateOfLeaving", "CurrentDesignation", "Department", "JobLocation", "PTState", "ESIContribution", "PFContribution", "PFCapping", "Handicap", "SeniorCitizen"]
        };

        function setfilename(val) {
            var fileName = val.substr(val.lastIndexOf("\\") + 1, val.length);
            document.getElementById("path").value = fileName;
        }

        function reset() {
            document.getElementById("path").value = '';
        }

        function UploadMassDetails() {
            //$('#spinner').show();
            if ($('[id$=path]').val() == '') {
                notify_e("Error", "Please select file.");
                return false;
            }
            else {
                var input, file, fr;
                if (typeof window.FileReader !== 'function') {
                    bodyAppend("p", "The file API isn't supported on this browser yet.");
                    return;
                }
                input = document.getElementById('file');
                if (!input) {
                    bodyAppend("p", "Um, couldn't find the fileinput element.");
                }
                else if (!input.files) {
                    bodyAppend("p", "This browser doesn't seem to support the `files` property of file inputs.");
                }
                else if (!input.files[0]) {
                    bodyAppend("p", "Please select a file before clicking 'Load'");
                }
                else {
                    file = input.files[0];
                    fr = new FileReader();
                    fr.readAsText(file);
                    fr.onload = function () {
                        var corrdata = CSVtoJSONforEmployeeMassInsert(fr.result);
                        var lines = fr.result.split("\n");
                        var headers = lines[0].split(",");
                        var myheaders = '';
                        var arrayLength = headers.length;
                        for (var i = 0; i < arrayLength; i++) {
                            if (myheaders == '') {
                                myheaders = headers[i];
                            }
                            else {
                                myheaders += ',' + headers[i];
                            }
                        }
                        var TemplateName = "";
                        if (arrayLength == 19) {
                            TemplateName = "MandatoryEmployeeMasterHeader";
                        }
                        else if (arrayLength == 62) {
                            TemplateName = "EmployeeMasterHeader";
                        }
                        var fileUpload = $("#file").get(0);
                        var files = fileUpload.files;
                        var data = new FormData();
                        for (var i = 0; i < files.length; i++) {
                            data.append(files[i].name, files[i]);
                        }
                        if (ValidateCSVTemplate(myheaders, TemplateName)) {
                            if (corrdata.length > 0) {
                                var JsonData = corrdata;
                                var ErrorData = '';
                                var GetErrorData = '';
                                //$('#spinner').show();
                                $.ajax({
                                    url: "/Handler/FileUploadHandler.ashx?Option=EmployeeMaster_MassInsert",
                                    type: "POST",
                                    data: data,
                                    contentType: false,
                                    processData: false,
                                    success: function (result) {
                                        if (result == "Success") {
                                            InsertEmployeeBulk(JsonData, TemplateName)
                                        }
                                    },
                                    error: function (err) {
                                        // $('#spinner').hide();
                                    }
                                });
                            }
                            else {
                                notify_e("Error", "You are trying to upload a blank template.");
                                //$('#spinner').hide();
                            }
                        }
                        else {
                            notify_e("Error", "Invalid Template.");
                            //$('#spinner').hide();
                        }
                    }

                }
            }
        }

        function CSVtoJSONforEmployeeMassInsert(csv) {
            csv = csv.replace(/\r\n/, '\n')
            var lines = csv.split("\n");
            var result = [];
            var headers = lines[0].split(",");
            for (var i = 1; i < lines.length; i++) {
                var obj = {};
                var currentline = lines[i].split(",");
                for (var j = 0; j < headers.length; j++) {
                    obj[headers[j]] = $.trim(currentline[j]);
                }
                result.push(obj);
            }
            var result1 = [];
            var incre = 1;
            $.each(result, function (key, value) {
                var valida = false;
                if ((value["SlNo"] != null && $.trim(value["SlNo"]) != '[FILLEDDATA]' && value["SlNo"].length > 0) ||
                    (value["EmployeeNo"] != null && $.trim(value["EmployeeNo"]) != '[FILLEDDATA]' && value["EmployeeNo"].length > 0) ||
                    (value["ClientID"] != null && $.trim(value["ClientID"]) != '[1-31]' && value["ClientID"].length > 0) ||
                    (value["DateOfBirth"] != null && $.trim(value["DateOfBirth"]) != '[FILLEDDATA]' && value["DateOfBirth"].length > 0) ||
                    (value["Gender"] != null && $.trim(value["Gender"]) != '[FILLEDDATA]' && value["Gender"].length > 0) ||
                    (value["Saluation"] != null && $.trim(value["Saluation"]) != '[FILLEDDATA]' && value["Saluation"].length > 0) ||
                    (value["EmployeeName"] != null && $.trim(value["EmployeeName"]) != '[FILLEDDATA]' && value["EmployeeName"].length > 0) ||
                    (value["Email"] != null && $.trim(value["Email"]) != '[FILLEDDATA]' && value["Email"].length > 0) ||
                    (value["MobileNo"] != null && $.trim(value["MobileNo"]) != '[FILLEDDATA]' && value["MobileNo"].length > 0) ||
                    (value["PresentAddress"] != null && $.trim(value["PresentAddress"]) != '[FILLEDDATA]' && value["PresentAddress"].length > 0) ||
                    (value["PresentCity"] != null && $.trim(value["PresentCity"]) != '[FILLEDDATA]' && value["PresentCity"].length > 0) ||
                    (value["PresentState"] != null && $.trim(value["PresentState"]) != '[FILLEDDATA]' && value["PresentState"].length > 0) ||
                    (value["PresentPincode"] != null && $.trim(value["PresentPincode"]) != '[FILLEDDATA]' && value["PresentPincode"].length > 0) ||
                    (value["PresentCountry"] != null && $.trim(value["PresentCountry"]) != '[FILLEDDATA]' && value["PresentCountry"].length > 0) ||
                    (value["Nationality"] != null && $.trim(value["Nationality"]) != '[FILLEDDATA]' && value["Nationality"].length > 0) ||
                    (value["JobType"] != null && $.trim(value["JobType"]) != '[FILLEDDATA]' && value["JobType"].length > 0) ||
                    (value["PermanentAddress"] != null && $.trim(value["PermanentAddress"]) != '[FILLEDDATA]' && value["PermanentAddress"].length > 0) ||
                    (value["PermanentCity"] != null && $.trim(value["PermanentCity"]) != '[FILLEDDATA]' && value["PermanentCity"].length > 0) ||
                    (value["PermanentState"] != null && $.trim(value["PermanentState"]) != '[FILLEDDATA]' && value["PermanentState"].length > 0) ||
                    (value["PermanentPincode"] != null && $.trim(value["PermanentPincode"]) != '[FILLEDDATA]' && value["PermanentPincode"].length > 0) ||
                    (value["PermanentCountry"] != null && $.trim(value["PermanentCountry"]) != '[FILLEDDATA]' && value["PermanentCountry"].length > 0) ||
                    (value["PermanentNationality"] != null && $.trim(value["PermanentNationality"]) != '[FILLEDDATA]' && value["PermanentNationality"].length > 0) ||
                    (value["PreviousExperience"] != null && $.trim(value["PreviousExperience"]) != '[FILLEDDATA]' && value["PreviousExperience"].length > 0) ||
                    (value["PreviousCompany"] != null && $.trim(value["PreviousCompany"]) != '[FILLEDDATA]' && value["PreviousCompany"].length > 0) ||
                    (value["PreviousDesignation"] != null && $.trim(value["PreviousDesignation"]) != '[FILLEDDATA]' && value["PreviousDesignation"].length > 0) ||
                    (value["PreviousDateOfJoining"] != null && $.trim(value["PreviousDateOfJoining"]) != '[FILLEDDATA]' && value["PreviousDateOfJoining"].length > 0) ||
                    (value["PreviousDateOfLeaving"] != null && $.trim(value["PreviousDateOfLeaving"]) != '[FILLEDDATA]' && value["PreviousDateOfLeaving"].length > 0) ||
                    (value["HighestQualification"] != null && $.trim(value["HighestQualification"]) != '[FILLEDDATA]' && value["HighestQualification"].length > 0) ||
                    (value["YearOfPassing"] != null && $.trim(value["YearOfPassing"]) != '[FILLEDDATA]' && value["YearOfPassing"].length > 0) ||
                    (value["Percentage"] != null && $.trim(value["Percentage"]) != '[FILLEDDATA]' && value["Percentage"].length > 0) ||
                    (value["InstituteName"] != null && $.trim(value["InstituteName"]) != '[FILLEDDATA]' && value["InstituteName"].length > 0) ||
                    (value["OfficialDateOfJoining"] != null && $.trim(value["OfficialDateOfJoining"]) != '[FILLEDDATA]' && value["OfficialDateOfJoining"].length > 0) ||
                    (value["OfficialDateOfLeaving"] != null && $.trim(value["OfficialDateOfLeaving"]) != '[FILLEDDATA]' && value["OfficialDateOfLeaving"].length > 0) ||
                    (value["CurrentDesignation"] != null && $.trim(value["CurrentDesignation"]) != '[FILLEDDATA]' && value["CurrentDesignation"].length > 0) ||
                    (value["Department"] != null && $.trim(value["Department"]) != '[FILLEDDATA]' && value["Department"].length > 0) ||
                    (value["CostCenter"] != null && $.trim(value["CostCenter"]) != '[FILLEDDATA]' && value["CostCenter"].length > 0) ||
                    (value["Branch"] != null && $.trim(value["Branch"]) != '[FILLEDDATA]' && value["Branch"].length > 0) ||
                    (value["PONumber"] != null && $.trim(value["PONumber"]) != '[FILLEDDATA]' && value["PONumber"].length > 0) ||
                    (value["Category"] != null && $.trim(value["Category"]) != '[FILLEDDATA]' && value["Category"].length > 0) ||
                    (value["JobLocation"] != null && $.trim(value["JobLocation"]) != '[FILLEDDATA]' && value["JobLocation"].length > 0) ||
                    (value["PTState"] != null && $.trim(value["PTState"]) != '[FILLEDDATA]' && value["PTState"].length > 0) ||
                    (value["ESIContribution"] != null && $.trim(value["ESIContribution"]) != '[FILLEDDATA]' && value["ESIContribution"].length > 0) ||
                    (value["PFContribution"] != null && $.trim(value["PFContribution"]) != '[FILLEDDATA]' && value["PFContribution"].length > 0) ||
                    (value["PFCapping"] != null && $.trim(value["PFCapping"]) != '[FILLEDDATA]' && value["PFCapping"].length > 0) ||
                    (value["Handicap"] != null && $.trim(value["Handicap"]) != '[FILLEDDATA]' && value["Handicap"].length > 0) ||
                    (value["SeniorCitizen"] != null && $.trim(value["SeniorCitizen"]) != '[FILLEDDATA]' && value["SeniorCitizen"].length > 0) ||
                    (value["PFUANNumber"] != null && $.trim(value["PFUANNumber"]) != '[FILLEDDATA]' && value["PFUANNumber"].length > 0) ||
                    (value["ESINumber"] != null && $.trim(value["ESINumber"]) != '[FILLEDDATA]' && value["ESINumber"].length > 0) ||
                    (value["AadharNumber"] != null && $.trim(value["AadharNumber"]) != '[FILLEDDATA]' && value["AadharNumber"].length > 0) ||
                    (value["PAN"] != null && $.trim(value["PAN"]) != '[FILLEDDATA]' && value["PAN"].length > 0) ||
                    (value["PassportNumber"] != null && $.trim(value["PassportNumber"]) != '[FILLEDDATA]' && value["PassportNumber"].length > 0) ||
                    (value["DrivingLicenseNumber"] != null && $.trim(value["DrivingLicenseNumber"]) != '[FILLEDDATA]' && value["DrivingLicenseNumber"].length > 0) ||
                    (value["OfficeAddress"] != null && $.trim(value["OfficeAddress"]) != '[FILLEDDATA]' && value["OfficeAddress"].length > 0) ||
                    (value["OfficeCity"] != null && $.trim(value["OfficeCity"]) != '[FILLEDDATA]' && value["OfficeCity"].length > 0) ||
                    (value["OfficeState"] != null && $.trim(value["OfficeState"]) != '[FILLEDDATA]' && value["OfficeState"].length > 0) ||
                    (value["OfficePincode"] != null && $.trim(value["OfficePincode"]) != '[FILLEDDATA]' && value["OfficePincode"].length > 0) ||
                    (value["OfficeCountry"] != null && $.trim(value["OfficeCountry"]) != '[FILLEDDATA]' && value["OfficeCountry"].length > 0) ||
                    (value["Paymode"] != null && $.trim(value["Paymode"]) != '[FILLEDDATA]' && value["Paymode"].length > 0) ||
                    (value["Bank"] != null && $.trim(value["Bank"]) != '[FILLEDDATA]' && value["Bank"].length > 0) ||
                    (value["BankBranch"] != null && $.trim(value["BankBranch"]) != '[FILLEDDATA]' && value["BankBranch"].length > 0) ||
                    (value["AccountNumber"] != null && $.trim(value["AccountNumber"]) != '[FILLEDDATA]' && value["AccountNumber"].length > 0) ||
                    (value["IFSCCode"] != null && $.trim(value["IFSCCode"]) != '[FILLEDDATA]' && value["IFSCCode"].length > 0)) {

                    var myObject = new Object();
                    myObject.SlNo = value["SlNo"];
                    myObject.EMP_NO = value["EmployeeNo"];
                    myObject.CLIENT_ID = value["ClientID"];
                    myObject.DOB = value["DateOfBirth"];
                    myObject.GENDER = value["Gender"];
                    myObject.TITLE = value["Saluation"];
                    myObject.EMP_NAME = value["EmployeeName"];
                    myObject.EMAIL = value["Email"];
                    myObject.MOBILE = value["MobileNo"];
                    myObject.PRESENT_ADDRESS = value["PresentAddress"];
                    myObject.PRESENT_CITY = value["PresentCity"];
                    myObject.PRESENT_STATE = value["PresentState"];
                    myObject.PRESENT_PINCODE = value["PresentPincode"];
                    myObject.PRESENT_COUNTRY = value["PresentCountry"];
                    myObject.NATIONALITY = value["Nationality"];
                    myObject.JOB_TYPE = value["JobType"];
                    myObject.PERMANENT_ADDRESS = value["PermanentAddress"];
                    myObject.PERMANENT_CITY = value["PermanentCity"];
                    myObject.PERMANENT_STATE = value["PermanentState"];
                    myObject.PERMANENT_PINCODE = value["PermanentPincode"];
                    myObject.PERMANENT_COUNTRY = value["PermanentCountry"];
                    myObject.PERMANENT_NATIONALITY = value["PermanentNationality"];
                    myObject.PREVEXP = value["PreviousExperience"];
                    myObject.PREVCOMPANY = value["PreviousCompany"];
                    myObject.PREVDESIGNATION = value["PreviousDesignation"];
                    myObject.PREVDOJ = value["PreviousDateOfJoining"];
                    myObject.PREVDOL = value["PreviousDateOfLeaving"];
                    myObject.HIGHESTQUALIFICATION = value["HighestQualification"];
                    myObject.PASSEDYEAR = value["YearOfPassing"];
                    myObject.SCOREPERCENTAGE = value["Percentage"];
                    myObject.INSTITUTENAME = value["InstituteName"];
                    myObject.OFFICIAL_DOJ = value["OfficialDateOfJoining"];
                    myObject.OFFICIAL_DOL = value["OfficialDateOfLeaving"];
                    myObject.DESIGNATION = value["CurrentDesignation"];
                    myObject.DEPARTMENT = value["Department"];
                    myObject.COST_CENTER = value["CostCenter"];
                    myObject.BRANCH = value["Branch"];
                    myObject.PONUMBER = value["PONumber"];
                    myObject.CATEGORY = value["Category"];
                    myObject.JOBLOCATION = value["JobLocation"];
                    myObject.PT_STATE = value["PTState"];
                    myObject.ESI_CONTRIBUTION = value["ESIContribution"];
                    myObject.PF_CONTRIBUTION = value["PFContribution"];
                    myObject.PF_CAPPING = value["PFCapping"];
                    myObject.HANDICAP = value["Handicap"];
                    myObject.SENIOR_CITIZEN = value["SeniorCitizen"];
                    myObject.PFUAN_NUMBER = value["PFUANNumber"];
                    myObject.ESI_NUMBER = value["ESINumber"];
                    myObject.AADHAR_NUMBER = value["AadharNumber"];
                    myObject.PAN = value["PAN"];
                    myObject.PASSPORT_NUMBER = value["PassportNumber"];
                    myObject.DRIVERSLICENSE = value["DrivingLicenseNumber"];
                    myObject.OFFICE_ADDRESS = value["OfficeAddress"];
                    myObject.OFFICE_CITY = value["OfficeCity"];
                    myObject.OFFICE_STATE = value["OfficeState"];
                    myObject.OFFICE_PINCODE = value["OfficePincode"];
                    myObject.OFFICE_COUNTRY = value["OfficeCountry"];
                    myObject.PAYMODE = value["Paymode"];
                    myObject.BANK = value["Bank"];
                    myObject.BANKBRANCH = value["BankBranch"];
                    myObject.ACC_NO = value["AccountNumber"];
                    myObject.IFSC_CODE = value["IFSCCode"];
                    result1.push(myObject);
                    incre++;
                }
            });
            if (result1 == '') {
                return '';
            }
            else {
                return JSON.stringify(result1);
            }
        };

        function ValidateCSVTemplate(Header, Key) {
            var IsValid = false;
            var mytestvalueArr = Header.split(",");
            $.each(template, function (key, val) {
                if (key == Key) {
                    IsValid = true;
                    if (val.length != mytestvalueArr.length) {
                        IsValid = false;
                        return IsValid;
                    }
                    else {
                        for (j = 0; j < val.length; j++) {
                            if (val[j].trim() != mytestvalueArr[j].trim()) {

                                IsValid = false;
                                return IsValid;
                            }
                            else {
                                IsValid = true;
                            }
                        }
                    }
                }
            });
            return IsValid;
        }

        function InsertEmployeeBulk(JsonData, TemplateName) {
            $.ajax({
                type: "POST",
                data: "{JsonData:'" + JsonData + "',Option:'" + TemplateName + "'}",
                url: "../WebServices/Payroll_Webservices.asmx/EmployeeInformation_MassInsert",
                contentType: "application/json",
                success: function (data) {
                    $("#tblEmployeeMasterError tbody").html("");
                    for (var i = 0; i < data.d.length; i++) {
                        if (data.d[0].Errorlines != "" && data.d[0].ErrorMessage != "") {
                            $("#tblEmployeeMasterError tbody").append(
                            '<tr>'
                            + '<td>' + data.d[i].ErrorMessage + '</td>'
                            + '<td>' + data.d[i].Errorlines + '</td>'
                            + '</tr>'
                      );
                            $('#tblEmployeeMasterError').show();
                            $.pnotify({
                                title: 'Error',
                                text: 'Unbale to upload..' + '<div><a href="#" onclick="Download_UplaodError();" id="EmpErrorDetails">Download error details</a></div>' + '',
                                opacity: .8,
                                type: 'error'
                            });
                            $('#tblEmployeeMasterError').hide();
                            //$('#spinner').hide();
                        }
                        else if (data.d[0].ErrorMessage != "") {
                            notify_s("Success", data.d[0].ErrorMessage);
                            //$('#spinner').hide();
                            $('#path').val('');
                            w2ui['grid'].destroy();
                            BindEmpMasterTable();
                        }
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    notify_e("Error", "Unable to upload file.");
                    //$('#spinner').hide();
                }
            });
        }

        var tableToExcel = (function () {
            var uri = 'data:application/vnd.ms-excel;base64,'
              , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
              , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
              , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
            return function (table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }
                window.location.href = uri + base64(format(template, ctx))
            }
        })()

        function Download_UplaodError() {
            tableToExcel("tblEmployeeMasterError", "EmployeeInformationError");
        }

        function CreateTableFromJSON() {
            var object = JSON.parse($('#dvExport').text());
            var my_array = new Array();
            for (var key in object) {
                my_array[key] = object[key];
            }
            var data, filename, link;
            var csv = convertArrayOfObjectsToCSV({
                data: my_array
            });
            if (csv == null) return;
            filename = 'Employee_Report.csv';
            if (!csv.match(/^data:text\/csv/i)) {
                csv = 'data:text/csv;charset=utf-8,' + csv;
            }
            data = encodeURI(csv);
            link = document.createElement('a');
            link.setAttribute('href', data);
            link.setAttribute('download', filename);
            link.click();
        }

        function gridExportBind() {
            var array = $('#dvExport').text();
            $("#gridExport").click(function (event) {
                CreateTableFromJSON();
            });
        }

        function Primary_Edit() {
            $('#Personal_PrimaryEdit').hide();
            $('#Personal_PrimarySave').show();
            $('#Personal_PrimaryCancel').show();
            $('.labview').hide();
            $('.txtview').show();
        }

        function Primary_Cancel() {
            $('#Personal_PrimaryEdit').show();
            $('#Personal_PrimarySave').hide();
            $('#Personal_PrimaryCancel').hide();
            $('.labview').show();
            $('.txtview').hide();
        }

        function dvContact_Back() {
            $('#Contact_Back').click(function (event) {
                $('#ContactDetails').show();
                $('#DetailsName').text('Contact Details');
                $('#dvPresentAddress').show();
                $('#dvPermanentAddress').show();
                $('#dvMailingAddress').show();
                $('#PresentAddressControls').hide();
                $('#PermanentAddressControls').hide();
                $('#MailingAddressControls').hide();
                $('#Personal_Contact_Edit').hide();
                $('#Contact_Back').hide();
            });
        }

        function dvPresentAddress() {
            $('#dvPresentAddress').click(function () {
                $('#dvPresentAddress').hide();
                $('#dvPermanentAddress').hide();
                $('#dvMailingAddress').hide();
                $('#DetailsName').text('Present Address');
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
                $('#PresentAddressControls').show();
            });
        }

        function dvPermanentAddress() {
            $('#dvPermanentAddress').click(function () {
                $('#dvPresentAddress').hide();
                $('#dvPermanentAddress').hide();
                $('#dvMailingAddress').hide();
                $('#DetailsName').text('Permanent Address');
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
                $('#PermanentAddressControls').show();
            });
        }

        function dvMailingAddress() {
            $('#dvMailingAddress').click(function () {
                $('#dvPresentAddress').hide();
                $('#dvPermanentAddress').hide();
                $('#dvMailingAddress').hide();
                $('#DetailsName').text('Mailing Address');
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
                $('#MailingAddressControls').show();
            });
        }

        function ContactDetails_Edit() {
            $('#BtnContactCancel').show();
            $('#BtnContactSave').show();

        }

        function Personal_Contact() {
            if ($('#DetailsName').text() == 'Present Address') {
                $('#Personal_Contact_Edit').hide();
                $('#BtnContactCancel').show();
                $('#BtnContactSave').show();
                $('.lblpresent').hide();
                $('.txtpresent').show();
                $('#Contact_Back').hide();
                $('#dvContact').find('input[type="text"]').each(function () {
                    if ($.trim($(this).val()) == '-') {
                        $(this).val('');
                    }
                });

            }
            else if ($('#DetailsName').text() == 'Permanent Address') {
                $('#Personal_Contact_Edit').hide();
                $('#BtnContactSave').hide();
                $('#btn_PermanentSave').show();
                $('#BtnContactCancel').show();
                $('.lblpermanent').hide();
                $('.txtpermanent').show();
                $('#Contact_Back').hide();
                $('#dvContact').find('input[type="text"]').each(function () {
                    if ($.trim($(this).val()) == '-') {
                        $(this).val('');
                    }
                });
            }
            else if ($('#DetailsName').text() == 'Mailing Address') {
                $('#Personal_Contact_Edit').hide();
                $('#BtnContactCancel').show();
                $('#btn_PermanentSave').hide();
                $('#BtnContactSave').hide();
                $('#btn_MailingSave').show();
                $('.lblmailing').hide();
                $('.txtmailing').show();
                $('#Contact_Back').hide();
                $('#dvContact').find('input[type="text"]').each(function () {
                    if ($.trim($(this).val()) == '-') {
                        $(this).val('');
                    }
                });
            }
            else {
                return false;
            }
        }

        function Contact_Edit_Cancel() {
            if ($('#DetailsName').text() == 'Present Address') {
                $('.txtpresent').hide();
                $('.lblpresent').show();
                $('#BtnContactCancel').hide();
                $('#BtnContactSave').hide();
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
            }
            else if ($('#DetailsName').text() == 'Permanent Address') {
                $('.txtpermanent').hide();
                $('.lblpermanent').show();
                $('#BtnContactCancel').hide();
                $('#BtnContactSave').hide();
                $('#btn_PermanentSave').hide();
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
            }
            else if ($('#DetailsName').text() == 'Mailing Address') {
                $('.txtmailing').hide();
                $('.lblmailing').show();
                $('#BtnContactCancel').hide();
                $('#BtnContactSave').hide();
                $('#btn_MailingSave').hide();
                $('#Personal_Contact_Edit').show();
                $('#Contact_Back').show();
            }
            else {
                return false;
            }
        }

        function WorkExperience_Edit() {
            $('#Btn_WorkExp_Edit').hide();
            $('#Btn_WorkExp_Save').show();
            $('#Btn_WorkExp_Cancel').show();
            $('.Workview').hide();
            $('.txtWorkview').show();
            $('#dvworkExperience').find('input[type="text"]').each(function () {
                if ($.trim($(this).val()) == '-') {
                    $(this).val('');
                }
            });
        }

        function Office_Edit() {
            $('#Btn_Office_edit').hide();
            $('#Btn_Office_Save').show();
            $('#Btn_Office_Cancel').show();
            $('.lbloffice').hide();
            $('.txtofficebank').show();
            var count = 0;
            $('#dvOfficial').find('input[type="text"]').each(function () {
                if ($.trim($(this).val()) == '-') {
                    $(this).val('');
                }
            });

        }

        function OfficeEdit_Cancel() {
            $('#Btn_Office_edit').show();
            $('#Btn_Office_Save').hide();
            $('#Btn_Office_Cancel').hide();
            $('.lbloffice').show();
            $('.txtofficebank').hide();
        }

        function WorkExp_Cancel() {
            $('#Btn_WorkExp_Edit').show();
            $('#Btn_WorkExp_Save').hide();
            $('#Btn_WorkExp_Cancel').hide();
            $('.Workview').show();
            $('.txtWorkview').hide();
        }

        function Bank_Edit() {
            $('#Btn_Bank_Edit').hide();
            $('#Btn_Bank_Save').show();
            $('#Btn_Bank_Cancel').show();
            $('.lblbank').hide();
            $('.txtbank').show();
            var count = 0;
            $('#dvOfficial').find('input[type="text"]').each(function () {
                if ($.trim($(this).val()) == '-') {
                    $(this).val('');
                }
            });

        }

        function BankEdit_Cancel() {
            $('#Btn_Bank_Edit').show();
            $('#Btn_Bank_Save').hide();
            $('#Btn_Bank_Cancel').hide();
            $('.lblbank').show();
            $('.txtbank').hide();
        }

        function CancelEmployeeView() {
            $('#contentOperation').show();
            $('#EmployeeView').hide();
            $('#txtHiddenEmpid').val('');
        }

        function BindEdit_saluation() {
            $('[id$=Edit_Saluation]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Salutation'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=Edit_Saluation]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=Edit_Saluation]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=Edit_Saluation]').select2();
                    }
                },
                failure: function (response) {
                }
            });
        }

        function BindEdit_jobtype() {
            $('[id$=Edit_JobType]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'JobType'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=Edit_JobType]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=Edit_JobType]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=Edit_JobType]').select2();
                    }
                },
                failure: function (response) {
                }
            });

        }

        function Bind_EditPayMode() {
            $('[id$=ddleditpaymentmode]').empty();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'PaymentMode'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            if (i == 0) {
                                $('[id$=ddleditpaymentmode]').append('<option value="0">Select</option><option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                            else {
                                $('[id$=ddleditpaymentmode]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">' + data.d[i].CLV_VALUE + '</option>');
                            }
                        }
                        $('[id$=ddleditpaymentmode]').select2();
                    }
                },
                failure: function (response) {
                }
            });
        }

        function EmployeeMasterView(Assc_ID, Option) {
            if (Option == "V") {
                $('#contentOperation').hide();
                $('#EmployeeView').show();
                BindEmpMasterByID(Assc_ID)
            }
            else {

            }
        }

        function BindEmpMasterByID(Assc_ID) {
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/BindEmpMasterByID",
                data: "{ClientID:'00FBG',Assc_ID:'" + Assc_ID + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            //Hideen Employee_ID
                            $('#txtHiddenEmpid').val(data.d[0].EM_ID);

                            //General Details                            
                            $('#lblProfile_EmpName').text(data.d[0].EM_NAME);
                            $('#lblProfile_EmpEmail').text(data.d[0].EM_EMAIL);
                            $('#txtEditEmpEmail').val(data.d[0].EM_EMAIL);
                            $('#lblProfile_EmpMobile').text(data.d[0].EM_MOBILE);
                            $('#txtEditEmpMobile').val(data.d[0].EM_MOBILE);
                            $('#lblProfile_EmpDOB').text(data.d[0].EM_DOB);
                            $('#txtEditEmpDob').val(data.d[0].EM_DOB);
                            //$('#lblProfile_EmpAddress').text(data.d[0].EM_PRESENT_ADDRESS);

                            //Employee Details
                            $('#lblpersonal_EmpNo').text(data.d[0].EM_EMP_NO);
                            $('#txtperson_EmpNo').val(data.d[0].EM_EMP_NO);

                            $('#lblpersonal_ClientID').text(data.d[0].EM_CLIENT_ID);
                            $('#txtperson_ClientID').val(data.d[0].EM_CLIENT_ID);

                            $('#lblpersonal_Saluation').text(data.d[0].EM_TITLE);
                            $("#Edit_Saluation").select2().select2('val', data.d[0].EM_SALUATIONVALUE);

                            $('#lblpersonal_JobType').text(data.d[0].EM_JOBTYPEVALUE);
                            $("#Edit_JobType").select2().select2('val', data.d[0].EM_JOB_TYPE);

                            $('#dvcheck span').removeClass("checked");
                            if (data.d[0].EM_GENDER == "M") {
                                $('#lblpersonal_Gender').text('Male');
                                $('#dvcheck span:eq(0)').addClass("checked");
                            }
                            else if (data.d[0].EM_GENDER == "F") {
                                $('#lblpersonal_Gender').text('Female');
                                $('#dvcheck span:eq(1)').addClass("checked");
                            }
                            else {

                            }

                            //PresrentAddress Details                         
                            $('#lblPresentAddress').text(data.d[0].EM_PRESENT_ADDRESS);
                            $('#txtEdit_PresentAddress').val(data.d[0].EM_PRESENT_ADDRESS);

                            $('#lblpresentstate').text(data.d[0].EM_PRESENT_STATE);
                            $('#txtEdit_PresentState').val(data.d[0].EM_PRESENT_STATE);

                            $('#lblPresentCity').text(data.d[0].EM_PRESENT_CITY);
                            $('#txtEdit_PresentCity').val(data.d[0].EM_PRESENT_CITY);

                            $('#lblPresentCountry').text(data.d[0].EM_PRESENT_COUNTRY);
                            $('#txtEdit_PresentCountry').val(data.d[0].EM_PRESENT_COUNTRY);

                            $('#lblpresentNationality').text(data.d[0].EM_NATIONALITY);
                            $('#txtEdit_PresentNationality').val(data.d[0].EM_NATIONALITY);

                            $('#lblpresentpincode').text(data.d[0].EM_PRESENT_PINCODE);
                            $('#txtEdit_PresentPincode').val(data.d[0].EM_PRESENT_PINCODE);

                            //Permanent Address Details
                            $('#lblpermanentAddress').text(data.d[0].EA_PERMANENT_ADDRESS);
                            $('#txtEdit_PermanentAddress').val(data.d[0].EA_PERMANENT_ADDRESS);

                            $('#lblPermanentState').text(data.d[0].EA_PERMANENT_STATE);
                            $('#txtEditPermanentState').val(data.d[0].EA_PERMANENT_STATE);

                            $('#lblPermanentCity').text(data.d[0].EA_PERMANENT_CITY);
                            $('#txtEditPermanentCity').val(data.d[0].EA_PERMANENT_CITY);

                            $('#lblPermanentCountry').text(data.d[0].EA_PERMANENT_COUNTRY);
                            $('#txtEdit_PermanentCountry').val(data.d[0].EA_PERMANENT_COUNTRY);

                            $('#lblPermanentNationality').text(data.d[0].EA_PERMANENT_NATIONALITY);
                            $('#txtEdit_PermanentNationality').val(data.d[0].EA_PERMANENT_NATIONALITY);

                            $('#lblPermanentPincode').text(data.d[0].EA_PERMANENT_PINCODE);
                            $('#txtEdit_PermanentPincode').val(data.d[0].EA_PERMANENT_PINCODE);

                            //Mailing Address Details
                            $('#lblMailingAddress').text(data.d[0].EA_MAILING_ADDRESS);
                            $('#txtEditMailingAddress').val(data.d[0].EA_MAILING_ADDRESS);

                            $('#lblMailingState').text(data.d[0].EA_MAILING_STATE);
                            $('#txtEditMailingState').val(data.d[0].EA_MAILING_STATE);

                            $('#lblMailingCity').text(data.d[0].EA_MAILING_CITY);
                            $('#txtEditMailingCity').val(data.d[0].EA_MAILING_CITY);

                            $('#lblMailingCountry').text(data.d[0].EA_MAILING_COUNTRY);
                            $('#txtEditMailingCountry').val(data.d[0].EA_MAILING_COUNTRY);

                            $('#lblMailingNationality').text(data.d[0].EA_MAILING_NATIONALITY);
                            $('#txtEditMailingNationality').val(data.d[0].EA_MAILING_NATIONALITY);

                            $('#lblMailingPincode').text(data.d[0].EA_MAILING_PINCODE);
                            $('#txtEditMailingPincode').val(data.d[0].EA_MAILING_PINCODE);

                            //Work Experience Details
                            $('#lblwork_Company').text(data.d[0].EW_PREVCOMPANY);
                            $('#txtwork_company').val(data.d[0].EW_PREVCOMPANY);

                            $('#lblwork_Designation').text(data.d[0].EW_PREVDESIGNATION);
                            $('#txtwork_Designation').val(data.d[0].EW_PREVDESIGNATION);

                            $('#lblwork_Exp').text(data.d[0].EW_PREVEXP);
                            $('#txtwork_Exp').val(data.d[0].EW_PREVEXP);

                            $('#lblwork_Skill').text(data.d[0].EW_SKILLS);
                            $('#txtwork_Skill').val(data.d[0].EW_SKILLS);

                            $('#lblwork_DOJ').text(data.d[0].EW_PREVDOJ);
                            $('#txtwork_DOJ').val(data.d[0].EW_PREVDOJ);

                            $('#lblwork_DOL').text(data.d[0].EW_PREVDOL);
                            $('#txtwork_DOL').val(data.d[0].EW_PREVDOL);

                            //Education Details                                              

                            if (data.d[0].Json_EducationDetails == "[]") {
                                $('#btn_EducationEdit').show();
                            }
                            else {
                                $('#btn_EducationEdit').hide();
                                var tableBody = '';
                                var json = JSON.parse(data.d[0].Json_EducationDetails);
                                $("#tblEducation_edit tbody").html("");
                                tableBody += "<tbody>";
                                for (var i = 0; i < json.length; i++) {
                                    tableBody += "<tr><td>" + json[i].QUALIFICATION + "</td><td>" + json[i].INSTITUTENAME + "</td><td>" + json[i].YEAROFPASSING + "</td><td>" + json[i].PERCENTAGE + "</td><td>" + '<button class="btn btn-link" type="button" id="EditEducation" onclick="Edit_Education(\'' + json[i].EMP_ID + '\');"><i class="glyphicon glyphicon-edit"></i></button>' + "</td></tr>";
                                }
                                //json[i].EMP_ID
                                tableBody += "</tbody>";
                                $("#tblEducation_edit").append(tableBody);
                            }


                            //Official Details                            
                            $('#lbloff_doj').text(data.d[0].EO_DOJ);
                            $('#txtoff_Editdoj').val(data.d[0].EO_DOJ);

                            $('#lbloff_dol').text(data.d[0].EO_DOL);
                            $('#txtoff_Editdol').val(data.d[0].EO_DOL);

                            $('#lbloff_designation').text(data.d[0].EO_DESIGNATION);
                            $('#txtoff_Editdesignation').val(data.d[0].EO_DESIGNATION);

                            $('#lbloff_department').text(data.d[0].EO_DEPARTMENT);
                            $('#txtoff_Editdepartment').val(data.d[0].EO_DEPARTMENT);

                            $('#lbloff_Branch').text(data.d[0].EO_BRANCH);
                            $('#txtoff_EditBranch').val(data.d[0].EO_BRANCH);

                            $('#lbloff_joblocation').text(data.d[0].EO_JOBLOCATION);
                            $('#txtoff_Editjoblocation').val(data.d[0].EO_JOBLOCATION);

                            $('#lbloff_CostCenter').text(data.d[0].EO_COST_CENTER);
                            $('#txtoff_EditCostCenter').val(data.d[0].EO_COST_CENTER);

                            $('#lbloff_PoNo').text(data.d[0].EO_PONUMBER);
                            $('#txtoff_EditPoNo').val(data.d[0].EO_PONUMBER);

                            $('#lbloff_Category').text(data.d[0].EO_CATEGORY);
                            $('#txtoff_EditCategory').val(data.d[0].EO_CATEGORY);

                            $('#lbloff_PTstate').text(data.d[0].EO_PT_STATE);
                            $('#txtoff_EditPtstate').val(data.d[0].EO_PT_STATE);

                            $('#lbloff_ESINO').text(data.d[0].EO_ESI_NUMBER);
                            $('#txtoff_EditESIno').val(data.d[0].EO_ESI_NUMBER);

                            $('#lbloff_AadharNo').text(data.d[0].EO_AADHAR_NUMBER);
                            $('#txtoff_EditAadharno').val(data.d[0].EO_AADHAR_NUMBER);

                            $('#lbloff_Pfuan').text(data.d[0].EO_PFUAN_NUMBER);
                            $('#txtoff_EditPfUan').val(data.d[0].EO_PFUAN_NUMBER);

                            $('#lbloff_Passport').text(data.d[0].EO_PASSPORT_NUMBER);
                            $('#txtoff_Editpassport').val(data.d[0].EO_PASSPORT_NUMBER);

                            $('#lbloff_Passport').text(data.d[0].EO_PASSPORT_NUMBER);
                            $('#txtoff_Editpassport').val(data.d[0].EO_PASSPORT_NUMBER);

                            $('#lbloff_DLno').text(data.d[0].EO_DRIVERSLICENSE);
                            $('#txtoff_EditDLno').val(data.d[0].EO_DRIVERSLICENSE);

                            $('#lbloff_PANno').text(data.d[0].EO_PAN);
                            $('#txtoff_EditPANno').val(data.d[0].EO_PAN);

                            $('#dvpfcapping span').removeClass("checked");
                            if (data.d[0].EO_PF_CAPPING == "Y") {
                                $('#lblpf_capping').text('Yes');
                                $('#dvpfcapping span:eq(0)').addClass("checked");
                                //$("input[name=rbpfcappingEdit][value='Y']").prop("checked", true);
                            }
                            else if (data.d[0].EO_PF_CAPPING == "N") {
                                $('#lblpf_capping').text('No');
                                $('#dvpfcapping span:eq(1)').addClass("checked");
                                //$("input[name=rbpfcappingEdit][value='N']").prop("checked", true);
                            }
                            else {
                            }

                            $('#dvesicontribution span').removeClass("checked");
                            if (data.d[0].EO_ESI_CONTRIBUTION == "Y") {
                                $('#lblrbesi_Edit').text('Yes');
                                $('#dvesicontribution span:eq(0)').addClass("checked");
                                //$("input[name=rbesi_Edit][value='Y']").prop("checked", true);
                            }
                            else if (data.d[0].EO_ESI_CONTRIBUTION == "N") {
                                $('#lblrbesi_Edit').text('No');
                                $('#dvesicontribution span:eq(1)').addClass("checked");
                                //$("input[name=rbesi_Edit][value='N']").prop("checked", true);
                            }
                            else {
                            }

                            $('#dvpfcontribution span').removeClass("checked");
                            if (data.d[0].EO_PF_CONTRIBUTION == "Y") {
                                $('#lbledit_pfcontribution').text('Yes');
                                $('#dvpfcontribution span:eq(0)').addClass("checked");
                                //$("input[name=rbpfcontri_edit][value='Y']").prop("checked", true);
                            }
                            else if (data.d[0].EO_PF_CONTRIBUTION == "N") {
                                $('#lbledit_pfcontribution').text('No');
                                $('#dvpfcontribution span:eq(1)').addClass("checked");
                                //$("input[name=rbpfcontri_edit][value='N']").prop("checked", true);
                            }
                            else {
                            }

                            $('#dvhandicap span').removeClass("checked");
                            if (data.d[0].EO_HANDICAP == "Y") {
                                $('#lblhandicap_edit').text('Yes');
                                $('#dvhandicap span:eq(0)').addClass("checked");
                                //$("input[name=rbhandicapEdit][value='Y']").prop("checked", true);
                            }
                            else if (data.d[0].EO_HANDICAP == "N") {
                                $('#lblhandicap_edit').text('No');
                                $('#dvhandicap span:eq(1)').addClass("checked");
                                //$("input[name=rbhandicapEdit][value='N']").prop("checked", true);
                            }
                            else {

                            }

                            $('#dvseniorcitizen span').removeClass("checked");
                            if (data.d[0].EO_SENIOR_CITIZEN == "Y") {
                                $('#lbledit_seniorcitizen').text('Yes');
                                $('#dvseniorcitizen span:eq(0)').addClass("checked");
                                //$("input[name=rbscedit][value='Y']").prop("checked", true);
                            }
                            else if (data.d[0].EO_SENIOR_CITIZEN == "N") {
                                $('#lbledit_seniorcitizen').text('No');
                                $('#dvseniorcitizen span:eq(1)').addClass("checked");
                                //$("input[name=rbscedit][value='N']").prop("checked", true);
                            }
                            else {

                            }

                            $('#lbloff_city').text(data.d[0].EO_OFFICE_CITY);
                            $('#txtoff_Editcity').val(data.d[0].EO_OFFICE_CITY);

                            $('#lbloff_state').text(data.d[0].EO_OFFICE_STATE);
                            $('#txtoff_editstate').val(data.d[0].EO_OFFICE_STATE);

                            $('#lbloff_state').text(data.d[0].EO_OFFICE_STATE);
                            $('#txtoff_editstate').val(data.d[0].EO_OFFICE_STATE);

                            $('#lbloff_country').text(data.d[0].EO_OFFICE_COUNTRY);
                            $('#txtoff_editCountry').val(data.d[0].EO_OFFICE_COUNTRY);

                            $('#lbloff_pincode').text(data.d[0].EO_OFFICE_PINCODE);
                            $('#txtoff_editpincode').val(data.d[0].EO_OFFICE_PINCODE);

                            $('#lbloff_address').text(data.d[0].EO_OFFICE_ADDRESS);
                            $('#txtoff_editAddress').val(data.d[0].EO_OFFICE_ADDRESS);

                            //Employee Bank Details
                            $('#lblbankifsccode').text(data.d[0].EB_IFSC_Code);
                            $('#txtbank_editifsccode').val(data.d[0].EB_IFSC_Code);

                            $('#lblbank_acc').text(data.d[0].EB_Account_Number);
                            $('#txtbank_editAccount').val(data.d[0].EB_Account_Number);

                            $('#lblbank_name').text(data.d[0].EB_Bank_Name);
                            $('#txtbank_editname').val(data.d[0].EB_Bank_Name);

                            $('#lblbankbranch').text(data.d[0].EB_Branch);
                            $('#txtbank_editBranch').val(data.d[0].EB_Branch);

                            $('#lblpaymentmode').text(data.d[0].EB_PAYMODE_VALUE);
                            $("#ddleditpaymentmode").select2().select2('val', data.d[0].EB_Payment_Mode);
                            //$('#ddleditpaymentmode').val(data.d[0].EB_Payment_Mode);

                            $('#lblbankaddress').text(data.d[0].EB_Address);
                            $('#txtbank_editaddress').val(data.d[0].EB_Address);

                            //document.getElementById("ProfileImage").src = data.d[0].EM_PROFILE_IMG;
                            //document.getElementById("ImageSetter").src = data.d[0].EM_PROFILE_IMG;
                        }
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load employee details.");
                }
            });
        }

        function JsonEmpty_EducationEdit() {
            $('#btn_EducationEdit').hide();
            $('#dvEducationTable').hide();
            $('#dvEducationEdit').show();
            $('#btn_EducationEmptyCancel').show();
            $('#btn_EducationEmptySave').show();
        }

        function JsonEmpty_EducationCancel() {
            $('#dvEducationEdit').hide();
            $('#btn_EducationEmptyCancel').hide();
            $('#btn_EducationEmptySave').hide();
            $('#dvEducationTable').show();
            $('#btn_EducationEdit').show();
        }

        function Validate_EmptyEducationDetails() {
            if ($('#txtQualiEdit').val() == '') {
                notify_e('Error', 'Please enter qualification.');
                $('#txtQualiEdit').focus();
                return false;
            }
            else if ($('#txtInstituteEdit').val() == '') {
                notify_e('Error', 'Please enter institute name.');
                $('#txtInstituteEdit').focus();
                return false;
            }
            else if ($('#txtYearPassingEdit').val() == '') {
                notify_e('Error', 'Please enter passed year.');
                $('#txtYearPassingEdit').focus();
                return false;
            }
            else if ($('#txtPercentageEdit').val() == '') {
                notify_e('Error', 'Please enter percentage.');
                $('#txtPercentageEdit').focus();
                return false;
            }
            else {
                return true;
            }
        }

        function GetEducation_Params() {
            var params =
            "{Emp_id:'" + $('#txtHiddenEmpid').val()
            + "',Qualification:'" + $('#txtQualiEdit').val()
            + "',InstituteName:'" + $('#txtInstituteEdit').val()
            + "',YearofPassing:'" + $('#txtYearPassingEdit').val()
            + "',Percentage:'" + $('#txtPercentageEdit').val()
            + "',Created_by:'" + 'Admin'
            + "'}";
            return params;
        }

        function EducatioDetails_Insert() {
            var Empid = $('#txtHiddenEmpid').val()
            var boolflag = false;
            var parameters = GetEducation_Params();
            boolflag = Validate_EmptyEducationDetails();
            if (boolflag == true) {
                $.ajax({
                    type: "POST",
                    url: "../WebServices/Payroll_Webservices.asmx/EducatioDetails_Insert",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "Success.") {
                            notify_s("Success", "Data uploaded successfully.");
                            Education_Cancel();
                            BindEmpMasterByID(Empid);
                        }
                        else {
                            notify_e("Error", data.d);
                        }
                    },
                    failure: function (response) {
                        notify_e("Error", "Error while uploading education details.");
                    }
                });
            }
            else {
                //notify_e("Error", "Error while uploading education details.");
            }
        }

        function Save_EducationDetails() {
            $("#btn_EducationEmptySave").click(function (event) {
                EducatioDetails_Insert();
            });
        }

        function GeneralEmployee_Details() {
            $('#btn_GeneralDetails_Edit').hide();
            $('#btn_GeneralDetails_Save').show();
            $('#btn_GeneralDetails_Cancel').show();
            $('#Emp_GeneralDetails').hide();
            $('#Emp_GeneralDetailsEdit').show();
            $('#Emp_GeneralDetailsEdit').find('input[type="text"]').each(function () {
                if ($.trim($(this).val()) == '-') {
                    $(this).val('');
                }
            });

        }

        function GeneralEmployee_DetailsCancel() {
            $('#btn_GeneralDetails_Edit').show();
            $('#btn_GeneralDetails_Save').hide();
            $('#btn_GeneralDetails_Cancel').hide();
            $('#Emp_GeneralDetails').show();
            $('#Emp_GeneralDetailsEdit').hide();
        }

        function Edit_Education(Empid) {
            $('#dvEducationEdit').show();
            $('#dvEducationTable').hide();
            $('#btn_Education_Cancel').show();
            $('#btn_Education_Save').show();
            Specific_EmployeeEducation_Details(Empid);
        }

        function Education_Cancel() {
            $('#dvEducationEdit').hide();
            $('#dvEducationTable').show();
            $('#btn_Education_Cancel').hide();
            $('#btn_Education_Save').hide();
            $('#btn_EducationEmptyCancel').hide();
            $('#btn_EducationEmptySave').hide();
        }

        function Specific_EmployeeEducation_Details(Empid) {
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/Specific_EmployeeEducation_Details",
                data: "{Emp_ID:'" + Empid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('#txtQualiEdit').val(data.d[0].EE_HIGHESTQUALIFICATION);
                            $('#txtInstituteEdit').val(data.d[0].EE_INSTITUTENAME);
                            $('#txtYearPassingEdit').val(data.d[0].EE_PASSEDYEAR);
                            $('#txtPercentageEdit').val(data.d[0].EE_SCOREPERCENTAGE);
                        }
                    }
                },
                failure: function (response) {

                }
            });
        }

        function GetUpdate_EmployeeParam(Option) {
            var Gender = (document.getElementById("Edit_rbmale").checked) ? Gender = 'M' : Gender = 'F';
            var PFCapping = (document.getElementById("editpfcapping_Y").checked) ? PFCapping = 'Y' : PFCapping = 'N';
            var ESIContribution = (document.getElementById("editesi_y").checked) ? ESIContribution = 'Y' : ESIContribution = 'N';
            var PFContribution = (document.getElementById("rbpfedit_Y").checked) ? PFContribution = 'Y' : PFContribution = 'N';
            var Handicap = (document.getElementById("editHandicap_Y").checked) ? Handicap = 'Y' : Handicap = 'N';
            var SeniorCitizen = (document.getElementById("rbscedit_Y").checked) ? SeniorCitizen = 'Y' : SeniorCitizen = 'N';

            var params =
            //Employee Profile
           "{Option:'" + Option
            + "',Emp_Id:'" + $('#txtHiddenEmpid').val()
            + "',Email:'" + $('#txtEditEmpEmail').val()
            + "',DOB:'" + $('#txtEditEmpDob').val()
            + "',Mobile:'" + $('#txtEditEmpMobile').val()
            //Employee Primary
            + "',Emp_No:'" + $('#txtperson_EmpNo').val()
            + "',Client_ID:'" + $('#txtperson_ClientID').val()
            + "',Saluation:'" + $('#Edit_Saluation option:selected').val()
            + "',JobType:'" + $('#Edit_JobType option:selected').val()
            + "',Gender:'" + Gender
            //Employee Present Address
            + "',Present_Address:'" + $('#txtEdit_PresentAddress').val()
            + "',Present_State:'" + $('#txtEdit_PresentState').val()
            + "',Present_City:'" + $('#txtEdit_PresentCity').val()
            + "',Present_Country:'" + $('#txtEdit_PresentCountry').val()
            + "',Present_Nationality:'" + $('#txtEdit_PresentNationality').val()
            + "',Present_Pincode:'" + $('#txtEdit_PresentPincode').val()
            //Employee Permanent Address
            + "',Permanent_Address:'" + $('#txtEdit_PermanentAddress').val()
            + "',Permanent_State:'" + $('#txtEditPermanentState').val()
            + "',Permanent_City:'" + $('#txtEditPermanentCity').val()
            + "',Permanent_Country:'" + $('#txtEdit_PermanentCountry').val()
            + "',Permanent_Nationality:'" + $('#txtEdit_PermanentNationality').val()
            + "',Permanent_Pincode:'" + $('#txtEdit_PermanentPincode').val()
            //Employee Mailing Address
            + "',Mailing_Address:'" + $('#txtEditMailingAddress').val()
            + "',Mailing_State:'" + $('#txtEditMailingState').val()
            + "',Mailing_City:'" + $('#txtEditMailingCity').val()
            + "',Mailing_Country:'" + $('#txtEditMailingCountry').val()
            + "',Mailing_Nationality:'" + $('#txtEditMailingNationality').val()
            + "',Mailing_Pincode:'" + $('#txtEditMailingPincode').val()
            //Employee Work Experience
            + "',Prev_Company:'" + $('#txtwork_company').val()
            + "',Prev_Designation:'" + $('#txtwork_Designation').val()
            + "',YearofExp:'" + $('#txtwork_Exp').val()
            + "',Skills:'" + $('#txtwork_Skill').val()
            + "',Prev_Doj:'" + $('#txtwork_DOJ').val()
            + "',Prev_Dol:'" + $('#txtwork_DOL').val()
            //Employee Education
            + "',Qualification:'" + $('#txtQualiEdit').val()
            + "',InstituteName:'" + $('#txtInstituteEdit').val()
            + "',YearofPassing:'" + $('#txtYearPassingEdit').val()
            + "',Percentage:'" + $('#txtPercentageEdit').val()
            //Employee Work
            + "',Official_Doj:'" + $('#txtoff_Editdoj').val()
            + "',Official_Dol:'" + $('#txtoff_Editdol').val()
            + "',Official_Designation:'" + $('#txtoff_Editdesignation').val()
            + "',Official_PFCapping:'" + PFCapping
            + "',Official_Department:'" + $('#txtoff_Editdepartment').val()
            + "',Official_PoNo:'" + $('#txtoff_EditPoNo').val()
            + "',Official_Branch:'" + $('#txtoff_EditBranch').val()
            + "',Official_ESIContribution:'" + ESIContribution
            + "',Official_JobLocation:'" + $('#txtoff_Editjoblocation').val()
            + "',Official_CostCenter:'" + $('#txtoff_EditCostCenter').val()
            + "',Official_Category:'" + $('#txtoff_EditCategory').val()
            + "',Official_PFContribution:'" + PFContribution
            + "',Official_PTState:'" + $('#txtoff_EditPtstate').val()
            + "',Official_ESINo:'" + $('#txtoff_EditESIno').val()
            + "',Official_AadharNo:'" + $('#txtoff_EditAadharno').val()
            + "',Official_Handicap:'" + Handicap
            + "',Official_PFUANNo:'" + $('#txtoff_EditPfUan').val()
            + "',Official_PassportNo:'" + $('#txtoff_Editpassport').val()
            + "',Official_DLNo:'" + $('#txtoff_EditDLno').val()
            + "',Official_SeniorCitizen:'" + SeniorCitizen
            + "',Official_PANNo:'" + $('#txtoff_EditPANno').val()
            + "',Official_City:'" + $('#txtoff_Editcity').val()
            + "',Official_State:'" + $('#txtoff_editstate').val()
            + "',Official_Country:'" + $('#txtoff_editCountry').val()
            + "',Official_Pincode:'" + $('#txtoff_editpincode').val()
            + "',Official_Address:'" + $('#txtoff_editAddress').val()
            //Employee Bank
            + "',Bank_IFSCCode:'" + $('#txtbank_editifsccode').val()
            + "',Bank_Account:'" + $('#txtbank_editAccount').val()
            + "',Bank_PayMode:'" + $('#ddleditpaymentmode option:selected').val()
            + "',Bank_Name:'" + $('#txtbank_editname').val()
            + "',Bank_Branch:'" + $('#txtbank_editBranch').val()
            + "',Bank_Address:'" + $('#txtbank_editaddress').val()

            + "',Created_By:'" + 'Admin'

            + "'}";
            return params;
        }

        function EmpProfile_DetailsUpdate() {
            $("#btn_GeneralDetails_Save").click(function (event) {
                if ($('#txtEditEmpEmail').val() == '') {
                    notify_e('Error', 'Please enter employee email.');
                    $('#txtEditEmpEmail').focus();
                    return false;
                }
                else if (!validateEmail($('#txtEditEmpEmail').val())) {
                    notify_e('Error', 'Please enter valid employee email.');
                    $('#txtEditEmpEmail').focus();
                    return false;
                }
                else if ($('#txtEditEmpMobile').val() == '') {
                    notify_e('Error', 'Please enter employee mobile number.');
                    $('#txtEditEmpMobile').focus();
                    return false;
                }
                else if ($('#txtEditEmpMobile').val().length < 10 || $('#txtEditEmpMobile').val().length > 10) {
                    notify_e('Error', 'Please enter 10 digit mobile no.');
                    $('#txtEditEmpMobile').focus();
                    return false;
                }
                else if ($('#txtEditEmpDob').val() == '') {
                    notify_e('Error', 'Please select date of birth.');
                    $('#txtEditEmpDob').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("EMPLOYEE_PROFILE");
                    Employee_Update(parameters);
                }
            });
        }

        function Employee_Update(parameters) {
            var Emp_ID = $('#txtHiddenEmpid').val();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/UpdateEmployee",
                data: parameters,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {

                    if (data.d == "Success.") {
                        notify_s("Success", "Data updated successfully.")
                        BindEmpMasterByID(Emp_ID);
                        GeneralEmployee_DetailsCancel();
                        Primary_Cancel();
                        WorkExp_Cancel();
                        Education_Cancel();
                        OfficeEdit_Cancel();
                        BankEdit_Cancel();
                    }
                    else if (data.d == "PRESENTSUCCESS.") {
                        notify_s("Success", "Data updated successfully.")
                        ShowPresentAddress_View();
                        BindEmpMasterByID(Emp_ID);
                    }

                    else if (data.d == "PERMANENTSUCCESS.") {
                        notify_s("Success", "Data updated successfully.")
                        ShowPermanentAddress_View();
                        BindEmpMasterByID(Emp_ID);
                    }
                    else if (data.d == "MAILINGSUCCESS.") {
                        notify_s("Success", "Data updated successfully.")
                        ShowMailingAddress_view();
                        BindEmpMasterByID(Emp_ID);
                    }
                    else {
                        notify_e("Error", data.d);
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to update employee details.');
                }

            });

        }

        function Primary_DetailsUpdate() {
            $("#Personal_PrimarySave").click(function (event) {
                if ($('#txtperson_EmpNo').val() == '') {
                    notify_e('Error', 'Please enter employee number.');
                    $('#txtperson_EmpNo').focus();
                    return false;
                }
                else if ($('#txtperson_ClientID').val() == '') {
                    notify_e('Error', 'Please enter client id.');
                    $('#txtperson_ClientID').focus();
                    return false;
                }
                else if ($('#Edit_Saluation option:selected').val() == 0) {
                    notify_e('Error', 'Please select saluation.')
                    $('#Edit_Saluation').focus();
                    return false;
                }
                else if ($('#Edit_JobType option:selected').val() == 0) {
                    notify_e('Error', 'Please select job type.')
                    $('#Edit_JobType').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("PRIMARY_DETAILS");
                    Employee_Update(parameters);
                }
            });
        }

        function PresentAdressUpdate() {
            $("#BtnContactSave").click(function (event) {
                if ($('#txtEdit_PresentAddress').val() == '') {
                    notify_e("Error", "Please enter present address.");
                    $('#txtEdit_PresentAddress').focus();
                    return false;
                }
                else if ($('#txtEdit_PresentState').val() == '') {
                    notify_e("Error", "Please enter present state.");
                    $('#txtEdit_PresentState').focus();
                    return false;
                }
                else if ($('#txtEdit_PresentCity').val() == '') {
                    notify_e("Error", "Please enter present city.");
                    $('#txtEdit_PresentCity').focus();
                    return false;
                }
                else if ($('#txtEdit_PresentCountry').val() == '') {
                    notify_e("Error", "Please enter present country.");
                    $('#txtEdit_PresentCountry').focus();
                    return false;
                }
                else if ($('#txtEdit_PresentNationality').val() == '') {
                    notify_e("Error", "Please enter present nationality.");
                    $('#txtEdit_PresentNationality').focus();
                    return false;
                }
                else if ($('#txtEdit_PresentPincode').val() == '') {
                    notify_e("Error", "Please enter present pincode.");
                    $('#txtEdit_PresentPincode').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("PRESENT_ADDRESS");
                    Employee_Update(parameters);
                }
            });
        }

        function PermanentAdressUpdate() {
            $("#btn_PermanentSave").click(function (event) {
                if ($('#txtEdit_PermanentAddress').val() == '') {
                    notify_e("Error", "Please enter permanent address.");
                    $('#txtEdit_PermanentAddress').focus();
                    return false;
                }
                else if ($('#txtEditPermanentState').val() == '') {
                    notify_e("Error", "Please enter permanent state.");
                    $('#txtEditPermanentState').focus();
                    return false;
                }
                else if ($('#txtEditPermanentCity').val() == '') {
                    notify_e("Error", "Please enter permanent city.");
                    $('#txtEditPermanentCity').focus();
                    return false;
                }
                else if ($('#txtEdit_PermanentCountry').val() == '') {
                    notify_e("Error", "Please enter permanent country.");
                    $('#txtEdit_PermanentCountry').focus();
                    return false;
                }
                else if ($('#txtEdit_PermanentNationality').val() == '') {
                    notify_e("Error", "Please enter permanent nationality.");
                    $('#txtEdit_PermanentNationality').focus();
                    return false;
                }
                else if ($('#txtEdit_PermanentPincode').val() == '') {
                    notify_e("Error", "Please enter permanent pincode.");
                    $('#txtEdit_PermanentPincode').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("PERMANENT_ADDRESS");
                    Employee_Update(parameters);
                }
            });
        }

        function MailingAdressUpdate() {
            $("#btn_MailingSave").click(function (event) {
                if ($('#txtEditMailingAddress').val() == '') {
                    notify_e("Error", "Please enter mailing address.");
                    $('#txtEditMailingAddress').focus();
                    return false;
                }
                else if ($('#txtEditMailingState').val() == '') {
                    notify_e("Error", "Please enter mailing state.");
                    $('#txtEditMailingState').focus();
                    return false;
                }
                else if ($('#txtEditMailingCity').val() == '') {
                    notify_e("Error", "Please enter mailing city.");
                    $('#txtEditMailingCity').focus();
                    return false;
                }
                else if ($('#txtEditMailingCountry').val() == '') {
                    notify_e("Error", "Please enter mailing country.");
                    $('#txtEditMailingCountry').focus();
                    return false;
                }
                else if ($('#txtEditMailingNationality').val() == '') {
                    notify_e("Error", "Please enter mailing nationality.");
                    $('#txtEditMailingNationality').focus();
                    return false;
                }
                else if ($('#txtEditMailingPincode').val() == '') {
                    notify_e("Error", "Please enter mailing pincode.");
                    $('#txtEditMailingPincode').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("MAILING_ADDRESS");
                    Employee_Update(parameters);
                }
            });
        }

        function Work_DetailsUpdate() {
            $("#Btn_WorkExp_Save").click(function (event) {
                if ($('#txtwork_company').val() == '') {
                    notify_e('Error', 'Please enter previous company name.');
                    $('#txtwork_company').focus();
                    return false;
                }
                else if ($('#txtwork_Designation').val() == '') {
                    notify_e('Error', 'Please enter previous designation.');
                    $('#txtwork_Designation').focus();
                    return false;
                }
                else if ($('#txtwork_Exp').val() == '') {
                    notify_e('Error', 'Please enter years of experience.');
                    $('#txtwork_Exp').focus();
                    return false;
                }
                else if ($('#txtwork_Skill').val() == '') {
                    notify_e('Error', 'Please enter skills.');
                    $('#txtwork_Skill').focus();
                    return false;
                }
                else if ($('#txtwork_DOJ').val() == '') {
                    notify_e('Error', 'Please select previous date of joining.');
                    $('#txtwork_DOJ').focus();
                    return false;
                }
                else if ($('#txtwork_DOL').val() == '') {
                    notify_e('Error', 'Please select previous date of leaving.');
                    $('#txtwork_DOL').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("WORK_EXPERIENCE");
                    Employee_Update(parameters);
                }
            });
        }

        function EduactionDetailsUpdate() {
            $("#btn_Education_Save").click(function (event) {
                if ($('#txtQualiEdit').val() == '') {
                    notify_e('Error', 'Please enter qualification.');
                    $('#txtQualiEdit').focus();
                    return false;
                }
                else if ($('#txtInstituteEdit').val() == '') {
                    notify_e('Error', 'Please enter institute name.');
                    $('#txtInstituteEdit').focus();
                    return false;
                }
                else if ($('#txtYearPassingEdit').val() == '') {
                    notify_e('Error', 'Please enter passed year.');
                    $('#txtYearPassingEdit').focus();
                    return false;
                }
                else if ($('#txtPercentageEdit').val() == '') {
                    notify_e('Error', 'Please enter percentage.');
                    $('#txtPercentageEdit').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("EDUCATION_DETAILS");
                    Employee_Update(parameters);
                }
            });
        }

        function Official_DetailsUpdate() {
            $("#Btn_Office_Save").click(function (event) {
                if ($('#txtoff_Editdoj').val() == '') {
                    notify_e("Error", "Please enter official date of joining.");
                    $('#txtoff_Editdoj').focus();
                    return false;
                }
                else if ($('#txtoff_Editdol').val() == '') {
                    notify_e("Error", "Please enter official date of leaving.");
                    $('#txtoff_Editdol').focus();
                    return false;
                }
                else if ($('#txtoff_Editdesignation').val() == '') {
                    notify_e("Error", "Please enter official designation.");
                    $('#txtoff_Editdesignation').focus();
                    return false;
                }
                else if ($('#txtoff_Editdepartment').val() == '') {
                    notify_e("Error", "Please enter official department.");
                    $('#txtoff_Editdepartment').focus();
                    return false;
                }
                else if ($('#txtoff_EditPoNo').val() == '') {
                    notify_e("Error", "Please enter official po number.");
                    $('#txtoff_EditPoNo').focus();
                    return false;
                }
                else if ($('#txtoff_EditBranch').val() == '') {
                    notify_e("Error", "Please enter official branch.");
                    $('#txtoff_EditBranch').focus();
                    return false;
                }
                else if ($('#txtoff_Editjoblocation').val() == '') {
                    notify_e("Error", "Please enter official job location.");
                    $('#txtoff_Editjoblocation').focus();
                    return false;
                }
                else if ($('#txtoff_EditCostCenter').val() == '') {
                    notify_e("Error", "Please enter official cost center.");
                    $('#txtoff_EditCostCenter').focus();
                    return false;
                }
                else if ($('#txtoff_EditCategory').val() == '') {
                    notify_e("Error", "Please enter official category.");
                    $('#txtoff_EditCategory').focus();
                    return false;
                }
                else if ($('#txtoff_EditPtstate').val() == '') {
                    notify_e("Error", "Please enter official PT state.");
                    $('#txtoff_EditPtstate').focus();
                    return false;
                }
                else if ($('#txtoff_EditESIno').val() == '') {
                    notify_e("Error", "Please enter official ESI number.");
                    $('#txtoff_EditESIno').focus();
                    return false;
                }
                else if ($('#txtoff_EditAadharno').val() == '') {
                    notify_e("Error", "Please enter aadhar number.");
                    $('#txtoff_EditAadharno').focus();
                    return false;
                }
                else if ($('#txtoff_EditPfUan').val() == '') {
                    notify_e("Error", "Please enter official pf uan number.");
                    $('#txtoff_EditPfUan').focus();
                    return false;
                }
                else if ($('#txtoff_Editpassport').val() == '') {
                    notify_e("Error", "Please enter official passport number.");
                    $('#txtoff_Editpassport').focus();
                    return false;
                }
                else if ($('#txtoff_EditDLno').val() == '') {
                    notify_e("Error", "Please enter official driving license number.");
                    $('#txtoff_EditDLno').focus();
                    return false;
                }
                else if ($('#txtoff_EditPANno').val() == '') {
                    notify_e("Error", "Please enter official PAN number.");
                    $('#txtoff_EditPANno').focus();
                    return false;
                }
                else if ($('#txtoff_Editcity').val() == '') {
                    notify_e("Error", "Please enter official city.");
                    $('#txtoff_Editcity').focus();
                    return false;
                }
                else if ($('#txtoff_editstate').val() == '') {
                    notify_e("Error", "Please enter official state.");
                    $('#txtoff_editstate').focus();
                    return false;
                }
                else if ($('#txtoff_editCountry').val() == '') {
                    notify_e("Error", "Please enter official country.");
                    $('#txtoff_editCountry').focus();
                    return false;
                }
                else if ($('#txtoff_editpincode').val() == '') {
                    notify_e("Error", "Please enter official pincode.");
                    $('#txtoff_editpincode').focus();
                    return false;
                }
                else if ($('#txtoff_editAddress').val() == '') {
                    notify_e("Error", "Please enter official address.");
                    $('#txtoff_editAddress').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("OFFICIAL_DETAILS");
                    Employee_Update(parameters);
                }
            });
        }

        function Bank_DetailsUpdate() {
            $("#Btn_Bank_Save").click(function (event) {
                if ($('#txtbank_editifsccode').val() == '') {
                    notify_e("Error", "Please enter bank IFSC code.");
                    $('#txtbank_editifsccode').focus();
                    return false;
                }
                else if ($('#txtbank_editAccount').val() == '') {
                    notify_e("Error", "Please enter account number.");
                    $('#txtbank_editAccount').focus();
                    return false;
                }
                else if ($('#txtbank_editAccount').val() == '') {
                    notify_e("Error", "Please enter account number.");
                    $('#txtbank_editAccount').focus();
                    return false;
                }
                else if ($('#ddleditpaymentmode option:selected').val() == 0) {
                    notify_e("Error", "Please select paymode.");
                    $('#ddleditpaymentmode').focus();
                    return false;
                }
                else if ($('#txtbank_editname').val() == '') {
                    notify_e("Error", "Please enter bank name.");
                    $('#txtbank_editname').focus();
                    return false;
                }
                else if ($('#txtbank_editBranch').val() == '') {
                    notify_e("Error", "Please enter bank branch.");
                    $('#txtbank_editBranch').focus();
                    return false;
                }
                else if ($('#txtbank_editaddress').val() == '') {
                    notify_e("Error", "Please enter bank address.");
                    $('#txtbank_editaddress').focus();
                    return false;
                }
                else {
                    var parameters = GetUpdate_EmployeeParam("BANK_DETAILS");
                    Employee_Update(parameters);
                }
            });
        }

        function ShowPresentAddress_View() {
            $('.txtpresent').hide();
            $('.lblpresent').show();
            $('#BtnContactCancel').hide();
            $('#BtnContactSave').hide();
            $('#Personal_Contact_Edit').show();
            $('#Contact_Back').show();
        }

        function ShowMailingAddress_view() {
            $('.txtmailing').hide();
            $('.lblmailing').show();
            $('#BtnContactCancel').hide();
            $('#BtnContactSave').hide();
            $('#btn_MailingSave').hide();
            $('#Personal_Contact_Edit').show();
            $('#Contact_Back').show();
        }

        function ShowPermanentAddress_View() {
            $('.txtpermanent').hide();
            $('.lblpermanent').show();
            $('#BtnContactCancel').hide();
            $('#BtnContactSave').hide();
            $('#btn_PermanentSave').hide();
            $('#Personal_Contact_Edit').show();
            $('#Contact_Back').show();
        }

    </script>

    <div class="workplace">
        <div id="contentOperation">
            <%--  <button class="btn btn-info pull-right" id="Button1" type="button">test</button>--%>
            <div class="row">
                <div class="col-md-4">
                    <div class="btn-group">
                        <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">Download Template<span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" onclick="DownloadBlankTemplate();"><i class="glyphicon glyphicon-download-alt"></i>&nbsp; All Fields</a></li>
                            <li><a href="#" onclick="DownloadMandatoryTemplate();"><i class="glyphicon glyphicon-download-alt"></i>&nbsp; Mandatory Fields</a></li>
                            <li class="divider"></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-4">
                    <%-- <input type="file" id="file" style="display: none;" onchange="setfilename(this.value);"  />
                    <input class="form-control nrb input-sm" disabled="disabled" id="path" placeholder="No file selected"  style="display: none;"/>
                <a href="#"  class="plupload_button plupload_start" id="btnEmp_massupload">Start upload</a>--%>
                    <div class="input-group pull-right">
                        <input type="file" id="file" style="display: none; background-color: white;" onchange="setfilename(this.value);" class="form-control" />
                        <input class="form-control nrb input-sm" disabled="disabled" id="path" placeholder="No file selected" />
                        <div class="input-group-btn">
                            <button type="button" style="height: 30px; top: -3px;" class="btn btn-primary  btn-iconed btn-sm " id="my-awesome-dropzone" onclick="document.getElementById('file').click();"><span>Browse</span></button>
                            <a href="#" onclick="UploadMassDetails();" class="plupload_button plupload_start" id="btnEmp_massupload">Start upload</a>
                        </div>

                    </div>
                </div>

                <div class="col-md-4">
                    <select name="Client" id="ddlclient" style="width: 100%;">
                    </select>
                </div>
            </div>
            <div class="dr"><span></span></div>
            <div class="row">
                <div class="col-md-12">
                    <div id="GridEmp">
                        <div class="head clearfix">
                            <div class="isw-user"></div>
                            <h1>Employee Details</h1>
                            <ul class="buttons">
                                <li><a href="#" id="CallAddEmp" title="Add" class="isw-plus"></a></li>
                                <li><a href="#" id="gridExport" title="Export" class="isw-download"></a></li>
                            </ul>
                        </div>
                        <div class="block-fluid">
                            <div class="overlay" id="spGridEmp">
                                <div class="loader "></div>
                            </div>
                            <div class="w2ui-page page-0" style="display: block; top: 30px; bottom: 58px; height: 350px;">
                                <div class="table-responsive">
                                    <div id="divgrid" style="width: 100%; height: 350px;">
                                    </div>
                                </div>
                            </div>
                            <div id="tblErrorEmployee">
                                <div class="table-responsive">
                                    <table id="tblEmployeeMasterError" class="" style="display: none;">
                                        <thead>
                                            <tr>
                                                <th>Error Message</th>
                                                <th>Error Lines</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <pre id="dvExport" style="display: none;"></pre>
                    <div id="showData"></div>

                    <div id="AddEmp">
                        <div class="head clearfix">
                            <div class="isw-user"></div>
                            <h1>Employee Master</h1>
                            <ul class="buttons">
                                <li><a href="#" id="GoBack" class="isw-left_circle"></a></li>
                            </ul>
                        </div>
                        <div class="block-fluid accordion" id="accordion">
                            <h3>Employee Details</h3>
                            <div id="EmployeeDetails">
                                <div class="row-form clearfix">
                                    <div class="row">
                                        <div class="col-md-2">Employee No*:</div>
                                        <div class="col-md-2">
                                            <input name="empno" id="txtempno" type="text" onkeypress="return ValidateCharacters(9);" />
                                        </div>
                                        <div class="col-md-2">Employee Name*:</div>
                                        <div class="col-md-2">
                                            <input name="empname" id="txtempname" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-1">Email:</div>
                                        <div class="col-md-2">
                                            <input name="email" id="txtemail" type="text" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-2">Client ID*:</div>
                                        <div class="col-md-2">
                                            <input name="ClientID" id="txtClientID" type="text" onkeypress="return ValidateCharacters(9);" />
                                        </div>
                                        <div class="col-md-2">Job Type*:</div>
                                        <div class="col-md-2">
                                            <select name="jobtype" id="ddljobtype" style="width: 100%;">
                                            </select>
                                        </div>

                                        <div class="col-md-1">Mobile:</div>
                                        <div class="col-md-2">
                                            <input name="mobileno" id="txtmobileno" type="text" onkeypress="return ValidateCharacters(8);" maxlength="10" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-2">Salutation*:</div>
                                        <div class="col-md-2">
                                            <select name="saluation" id="ddlsaluation" style="width: 100%;">
                                            </select>
                                        </div>
                                        <div class="col-md-2">Date of Birth*:</div>
                                        <div class="col-md-2">
                                            <%--<input type="text" id="txtdob" name="dob" />  --%>
                                            <div class="input-group datepicker-custom">
                                                <input type="text" id="txtdob" name="dob" placeholder="DD-MM-YYYY">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>

                                        <div class="col-md-1">Gender*:</div>
                                        <div class="col-md-3">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="rbmale" value="M" name="rbgender" />Male
                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="rbfemale" value="F" name="rbgender" />Female
                                   
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-form clearfix">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="name">
                                                <h5>Present Address</h5>
                                                <div class="row">
                                                    <div class="col-md-4">Address*:</div>
                                                    <div class="col-md-8">
                                                        <textarea name="address" class="textarea-tl" id="txtaddress" rows="3" style="resize: none;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                    </div>
                                                    <div class="col-md-4">City*:</div>
                                                    <div class="col-md-8">
                                                        <input name="city" id="txtcity" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">State*:</div>
                                                    <div class="col-md-8">
                                                        <input name="state" id="txtstate" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Nationality*:</div>
                                                    <div class="col-md-8">
                                                        <input name="nationality" id="txtnationality" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Country*:</div>
                                                    <div class="col-md-8">
                                                        <input name="country" id="txtcountry" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">pincode*:</div>
                                                    <div class="col-md-8">
                                                        <input name="pincode" id="txtpincode" type="text" onkeypress="return ValidateCharacters(8);" maxlength="6" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4" style="border-left: 1px solid #ddd;">
                                            <div class="name">
                                                <h5>Permanent Address</h5>
                                                <div class="row">
                                                    <div class="col-md-4">Address*:</div>
                                                    <div class="col-md-8">
                                                        <textarea name="address" class="textarea-tl" id="txtper_address" rows="3" style="resize: none;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                    </div>
                                                    <div class="col-md-4">City*:</div>
                                                    <div class="col-md-8">
                                                        <input name="per_city" id="txtper_city" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">State*:</div>
                                                    <div class="col-md-8">
                                                        <input name="per_state" id="txtper_state" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Nationality*:</div>
                                                    <div class="col-md-8">
                                                        <input name="per_nationality" id="txtper_nationality" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Country*:</div>
                                                    <div class="col-md-8">
                                                        <input name="per_country" id="txtper_country" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">pincode*:</div>
                                                    <div class="col-md-8">
                                                        <input name="per_pincode" id="txtper_pincode" type="text" onkeypress="return ValidateCharacters(8);" maxlength="6" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-4" style="border-left: 1px solid #ddd;">
                                            <div class="name">
                                                <h5>Mailing Address</h5>
                                                <div class="row">
                                                    <div class="col-md-4">Address:</div>
                                                    <div class="col-md-8">
                                                        <textarea name="address" class="textarea-tl" id="txtmail_address" rows="3" style="resize: none;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                    </div>
                                                    <div class="col-md-4">City:</div>
                                                    <div class="col-md-8">
                                                        <input name="city" id="txtmail_city" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">State:</div>
                                                    <div class="col-md-8">
                                                        <input name="state" id="txtmail_state" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Nationality:</div>
                                                    <div class="col-md-8">
                                                        <input name="nationality" id="txtmail_nationality" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">Country:</div>
                                                    <div class="col-md-8">
                                                        <input name="country" id="txtmail_country" type="text" onkeypress="return ValidateCharacters(2);" />
                                                    </div>
                                                    <div class="col-md-4">pincode:</div>
                                                    <div class="col-md-8">
                                                        <input name="pincode" id="txtmail_pincode" type="text" onkeypress="return ValidateCharacters(8);" maxlength="6" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-form clearfix">
                                    <div class="row">
                                        <button class="btn btn-info pull-right" id="btn_next" type="button">Next</button>
                                    </div>
                                </div>
                            </div>

                            <h3>Education Details</h3>
                            <div id="EducationDetails">
                                <div class="row-form clearfix">
                                    <div class="row">
                                        <div style="float: right;">
                                            <i class="isb-plus" title="Add New Row" id="addnewrow"></i>
                                            <i class="isb-cancel" title="Delete Row" id="deleterow"></i>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <%--   <table id="tbleducation">
                                        <tr>
                                            <td>
                                                <div class="col-md-6">Qualification:</div>
                                                <div class="col-md-6">
                                                    <input name="Qualification[]" id="txtqualification" type="text" onkeypress="return ValidateCharacters(2);" />
                                                </div>

                                            </td>
                                            <td>
                                                <div class="col-md-6">Institution Name:</div>
                                                <div class="col-md-6">
                                                    <input name="Qualification[]" id="txtinstituename" type="text" onkeypress="return ValidateCharacters(2);" />
                                                </div>

                                            </td>
                                            <td>
                                                <div class="col-md-6">Year of Passing:</div>
                                                <div class="col-md-6">
                                                    <input name="Qualification[]" id="txtyearofpassing" type="text" onkeypress="return ValidateCharacters(8);" maxlength="4" />
                                                </div>
                                            </td>
                                            <td>
                                                <div class="col-md-6">Percentage:</div>
                                                <div class="col-md-6">
                                                    <input name="Qualification[]" id="txtpercentage" type="text" />
                                                </div>
                                            </td>
                                        </tr>
                                    </table>--%>
                                        <div class="col-md-12">
                                            <div class="block-fluid">
                                                <table id="tbleducation" cellpadding="0" cellspacing="0" class="table">
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 200px;">Qualification</th>
                                                            <th style="width: 200px;">Institution Name</th>
                                                            <th style="width: 200px;">Year of Passing</th>
                                                            <th style="width: 200px;">Percentage</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 200px;">
                                                                <div class="col-md-8">
                                                                    <input name="Qualification[]" id="txtqualification" type="text" onkeypress="return ValidateCharacters(2);" />
                                                                </div>
                                                            </td>

                                                            <td style="width: 200px;">
                                                                <div class="col-md-8">
                                                                    <input name="Qualification[]" id="txtinstituename" type="text" onkeypress="return ValidateCharacters(2);" />
                                                                </div>
                                                            </td>
                                                            <td style="width: 200px;">
                                                                <div class="col-md-8">
                                                                    <input name="Qualification[]" id="txtyearofpassing" type="text" onkeypress="return ValidateCharacters(8);" maxlength="4" />
                                                                </div>
                                                            </td>
                                                            <td style="width: 200px;">
                                                                <div class="col-md-8">
                                                                    <input name="Qualification[]" id="txtpercentage" type="text" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-form clearfix">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button class="btn btn-info pull-left" id="btn_previous" type="button">Previous</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-info pull-right" id="btn_educationNext" type="button">Next</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h3>Official Details</h3>
                            <div id="OfficialDetails">
                                <div class="row-form clearfix">
                                    <div class="name">
                                        <h5>Work Experience Details</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Previous Company*:</div>
                                        <div class="col-md-2">
                                            <input name="pervcompany" id="txtpervcompany" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Previous Designation*:</div>
                                        <div class="col-md-2">
                                            <input name="prevdesig" id="txtprevdesig" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Years of Exp*:</div>
                                        <div class="col-md-2">
                                            <input name="prevyearsexp" id="txtyearsexp" type="text" onkeypress="return ValidateCharacters(8);" maxlength="2" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Skills:</div>
                                        <div class="col-md-2">
                                            <input name="skills" id="txtskills" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Date of Joining*:</div>
                                        <div class="col-md-2">
                                            <%--<input id="txtpervdoj" name="Prev_off_doj" type="text" />--%>
                                            <div class="input-group datepicker-custom">
                                                <input id="txtpervdoj" name="Prev_off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-2">Date of Leaving*:</div>
                                        <div class="col-md-2">
                                            <%--<input id="txtprevdol" name="Prev_off_dol" type="text" />--%>
                                            <div class="input-group datepicker-custom">
                                                <input id="txtprevdol" name="Prev_off_dol" type="text" placeholder="DD-MM-YYYY" />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row-form clearfix">
                                    <div class="name">
                                        <h5>Official Details</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Date of Joining*:</div>
                                        <div class="col-md-2">
                                            <%-- <input id="txtoff_doj" name="off_doj" type="text" />--%>
                                            <div class="input-group datepicker-custom">
                                                <input id="txtoff_doj" name="off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-2">Date of Leaving*:</div>
                                        <div class="col-md-2">
                                            <%--<input id="txtoff_dol" name="off_dol" type="text" />--%>
                                            <div class="input-group datepicker-custom">
                                                <input id="txtoff_dol" name="off_dol" type="text" placeholder="DD-MM-YYYY" />
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-2">Designation:</div>
                                        <div class="col-md-2">
                                            <input name="off_designation" id="txtoff_designation" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Department*:</div>
                                        <div class="col-md-2">
                                            <input name="off_department" id="txtoff_department" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Branch:</div>
                                        <div class="col-md-2">
                                            <input name="off_branch" id="txtoff_branch" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Job Location*:</div>
                                        <div class="col-md-2">
                                            <input name="off_joblocation" id="txtoff_joblocation" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Cost Center:</div>
                                        <div class="col-md-2">
                                            <input name="off_costcenter" id="txtoff_costcenter" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">PO No:</div>
                                        <div class="col-md-2">
                                            <input name="off_ponumber" id="txtoff_ponumber" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                        <div class="col-md-2">Category:</div>
                                        <div class="col-md-2">
                                            <input name="off_category" id="txtoff_category" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">PT State*:</div>
                                        <div class="col-md-2">
                                            <input name="off_ptstation" id="txtoff_ptstation" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">ESI No:</div>
                                        <div class="col-md-2">
                                            <input name="off_esinumber" id="txtoff_esinumber" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                        <div class="col-md-2">Aadhar No:</div>
                                        <div class="col-md-2">
                                            <input name="off_aadharnum" id="txtoff_aadharnum" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">PF UAN No:</div>
                                        <div class="col-md-2">
                                            <input name="off_uannumber" id="txtoff_uannumber" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                        <div class="col-md-2">Passport No:</div>
                                        <div class="col-md-2">
                                            <input name="off_passportnum" id="txtoff_passportnum" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                        <div class="col-md-2">DL No:</div>
                                        <div class="col-md-2">
                                            <input name="off_driverslicense" id="txtoff_driverslicense" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">PAN No:</div>
                                        <div class="col-md-2">
                                            <input name="off_pan" id="txtoff_pan" type="text" onkeypress="return ValidateCharacters(3);" />
                                        </div>
                                        <div class="col-md-2">PF Capping:</div>
                                        <div class="col-md-2">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="pfc-ys" value="Y" name="rbpfcapping" />Yes                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="pfc-n" value="N" name="rbpfcapping" />No                                   
                                            </label>
                                        </div>
                                        <div class="col-md-2">ESI Contribution*:</div>
                                        <div class="col-md-2">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="erb-ys" value="Y" name="rbesi" />Yes                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="erb-n" value="N" name="rbesi" />No                                   
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">PF Contribution*:</div>
                                        <div class="col-md-2">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="pfrb-ys" value="Y" name="rbpfc" />Yes                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="pfrb-n" value="N" name="rbpfc" />No                                   
                                            </label>
                                        </div>
                                        <div class="col-md-2">Handicap*:</div>
                                        <div class="col-md-2">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="hrb-ys" value="Y" name="rbhandicap" />Yes                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="hrb-n" value="N" name="rbhandicap" />No                                   
                                            </label>
                                        </div>
                                        <div class="col-md-2">Senior Citizen*:</div>
                                        <div class="col-md-2">
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="scrb-ys" value="Y" name="rbsc" />Yes                                   
                                            </label>
                                            <label class="checkbox checkbox-inline">
                                                <input type="radio" id="scrb-n" value="N" name="rbsc" />No                                   
                                            </label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">State:</div>
                                        <div class="col-md-2">
                                            <input name="off_state" id="txtoff_state" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">City:</div>
                                        <div class="col-md-2">
                                            <input name="off_city" id="txtoff_city" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Country:</div>
                                        <div class="col-md-2">
                                            <input name="off_country" id="txtoff_country" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Pin Code:</div>
                                        <div class="col-md-2">
                                            <input name="off_pincode" id="txtoff_pincode" type="text" onkeypress="return ValidateCharacters(8);" maxlength="6" />
                                        </div>
                                        <div class="col-md-2">Address:</div>
                                        <div class="col-md-6">
                                            <input name="off_address" id="txtoff_address" type="text" onkeypress="return ValidateCharacters(9);" />
                                            <%-- <textarea name="address" class="textarea-tl" id="txtoff_address"  style="resize: none;"></textarea>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-form clearfix">
                                    <div class="name">
                                        <h5>Bank Details</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">IFSC Code:</div>
                                        <div class="col-md-2">
                                            <%--<input name="ifsccode" id="txtifsccode" type="text" />--%>
                                            <div class="input-group addin-search" id="GetDetails">
                                                <input type="text" name="ifsccode" id="txtifsccode" onkeypress="return ValidateCharacters(9);">
                                                <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                            </div>
                                        </div>
                                        <div class="col-md-2">Payment Mode:</div>
                                        <div class="col-md-2">
                                            <select name="bank_paymentmode" id="ddlpaymentmode" style="width: 100%;">
                                                <option value="0">Select</option>
                                                <option value="NEFT">NEFT</option>
                                                <option value="RTGS">RTGS</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2">Account Number:</div>
                                        <div class="col-md-2">
                                            <input name="acc_no" id="txtacc_no" type="text" onkeypress="return ValidateCharacters(8);" />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2">Bank Name:</div>
                                        <div class="col-md-2">
                                            <input name="bankname" id="txtbankname" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Branch:</div>
                                        <div class="col-md-2">
                                            <input name="branch" id="txtbankbranch" type="text" onkeypress="return ValidateCharacters(2);" />
                                        </div>
                                        <div class="col-md-2">Address:</div>
                                        <div class="col-md-2">
                                            <input name="branch" id="txtbankaddress" type="text" onkeypress="return ValidateCharacters(9);" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row-form clearfix">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button class="btn btn-info pull-left" id="btn_Official_previous" type="button">Previous</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button type="button" id="btnsave_employee" class="btn btn-success pull-right" onclick="return false;">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="dr"><span></span></div>
        </div>

        <div id="EmployeeView">
            <div class="row">
                <div class="col-md-12">
                    <div class="btn-group pull-right">
                        <button class="btn btn-sm btn-primary pull-right" type="button" onclick="CancelEmployeeView();" id="CancelView" title="Close" style="top: 20px;">Go Back</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="profile clearfix">
                        <div class="user clearfix">
                            <div class="avatar">
                                <img src="/img/users/user_profile.jpg" class="img-thumbnail" />
                            </div>
                            <h2 id="lblProfile_EmpName"></h2>
                            <div class="actions">
                                <div class="btn-group">
                                    <%--<a href="#" onclick="CancelEmployeeView();" id="CancelView" title="Close" class="glyphicon glyphicon-remove"></a>--%>
                                    <button class="btn btn-link pull-right" type="button" id="btn_GeneralDetails_Edit" onclick="GeneralEmployee_Details();"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                    <button class="btn btn-link pull-right" type="button" id="btn_GeneralDetails_Save"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                    <button class="btn btn-link pull-right" type="button" id="btn_GeneralDetails_Cancel" onclick="GeneralEmployee_DetailsCancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                </div>
                            </div>
                        </div>
                        <div class="info" id="Emp_GeneralDetails">
                            <p><span class="glyphicon glyphicon-gift"></span><span class="title">Email:</span><span id="lblProfile_EmpEmail"></span></p>
                            <p><span class="glyphicon glyphicon-gift"></span><span class="title">Mobile No:</span><span id="lblProfile_EmpMobile"></span></p>
                            <p><span class="glyphicon glyphicon-gift"></span><span class="title">Date of birth:</span><span id="lblProfile_EmpDOB"></span></p>
                            <%--<p><span class="glyphicon glyphicon-globe"></span><span class="title">Address:</span><span id="lblProfile_EmpAddress"></span></p>--%>
                        </div>
                        <div class="info" id="Emp_GeneralDetailsEdit">
                            <ul class="rows">
                                <li>
                                    <div class="title">Email:</div>
                                    <div class="text">
                                        <input type="text" id="txtEditEmpEmail" />
                                    </div>
                                </li>
                                <li>
                                    <div class="title">Mobile No:</div>
                                    <div class="text">
                                        <input type="text" id="txtEditEmpMobile" />
                                    </div>
                                </li>
                                <li>
                                    <div class="title">Date of birth:</div>
                                    <div class="text">
                                        <div class="input-group datepicker-custom">
                                            <input id="txtEditEmpDob" name="EditEmpDob" type="text" placeholder="DD-MM-YYYY" />
                                            <span class="input-group-addon" style="margin-top: -3px;"><i class="glyphicon glyphicon-calendar"></i></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <%-- <div class="col-md-7" style="margin-top:46px;">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 148px;">
                            <div class="mCustomScrollBox mCS-light" id="Div10" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b>Applicable Pay Codes</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>--%>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 15px;">
                            <div class="mCustomScrollBox mCS-light" id="Div2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b>Personal Information</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 205px;">
                            <div class="mCustomScrollBox mCS-light" id="Div1" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b>Primary Details</b>
                                        <button class="btn btn-link pull-right" type="button" id="Personal_PrimaryEdit" onclick="Primary_Edit();"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                        <button class="btn btn-link pull-right" type="button" id="Personal_PrimarySave"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="Personal_PrimaryCancel" onclick="Primary_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                    </div>
                                    <div class="info">
                                        <ul class="rows">
                                            <li>
                                                <div class="title">Employee No:</div>
                                                <div class="text labview" id="lblpersonal_EmpNo"></div>
                                                <div class="text txtview">
                                                    <input type="text" id="txtperson_EmpNo" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Client ID:</div>
                                                <div class="text labview" id="lblpersonal_ClientID"></div>
                                                <div class="text txtview">
                                                    <input type="text" id="txtperson_ClientID" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Saluation:</div>
                                                <div class="text labview" id="lblpersonal_Saluation"></div>
                                                <div class="text txtview">
                                                    <select name="Editsaluation" id="Edit_Saluation" style="width: 85%;">
                                                    </select>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Job Type:</div>
                                                <div class="text labview" id="lblpersonal_JobType"></div>
                                                <div class="text txtview">
                                                    <select name="EditJobType" id="Edit_JobType" style="width: 85%;">
                                                    </select>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Gender:</div>
                                                <div class="text labview" id="lblpersonal_Gender"></div>
                                                <div class="text txtview" id="dvcheck">
                                                    <label class="checkbox checkbox-inline">
                                                        <input type="radio" id="Edit_rbmale" value="M" name="GenderEdit" checked="checked" />Male                                   
                                                    </label>
                                                    <label class="checkbox checkbox-inline">
                                                        <input type="radio" id="Edit_rbfemale" value="F" name="GenderEdit" />Female                                   
                                                    </label>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8" id="dvContact">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;" id="ContactDetails">

                        <div class="" style="height: auto;">
                            <div class="mCustomScrollBox mCS-light" id="Div3" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b id="DetailsName">Contact Details</b>
                                        <button class="btn btn-link pull-right" type="button" id="Personal_Contact_Edit" onclick="Personal_Contact();"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                        <button class="btn btn-link pull-right" type="button" id="Contact_Back" onclick="dvContact_Back();"><i class="glyphicon glyphicon-arrow-left"></i>&nbsp;Back</button>
                                        <button class="btn btn-link pull-right" type="button" id="BtnContactSave"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_PermanentSave"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_MailingSave"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="BtnContactCancel" onclick="Contact_Edit_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>


                                    </div>
                                    <div class="info">
                                        <div id="PresentAddressControls">
                                            <div class="info">
                                                <ul class="rows">
                                                    <li class="col-md-12">
                                                        <div class="title">Address:</div>
                                                        <div class="text lblpresent" id="lblPresentAddress"></div>
                                                        <div class="text txtpresent">
                                                            <%--<input type="text" style="width: 90%;" />--%>
                                                            <textarea name="address" class="textarea-tl" id="txtEdit_PresentAddress" style="resize: none; height: 35px;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">State:</div>
                                                        <div class="text lblpresent" id="lblpresentstate"></div>
                                                        <div class="text txtpresent">
                                                            <input type="text" id="txtEdit_PresentState" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">City:</div>
                                                        <div class="text lblpresent" id="lblPresentCity"></div>
                                                        <div class="text txtpresent">
                                                            <input type="text" id="txtEdit_PresentCity" />
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">Country:</div>
                                                        <div class="text lblpresent" id="lblPresentCountry"></div>
                                                        <div class="text txtpresent">
                                                            <input type="text" id="txtEdit_PresentCountry" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Nationality:</div>
                                                        <div class="text lblpresent" id="lblpresentNationality"></div>
                                                        <div class="text txtpresent">
                                                            <input type="text" id="txtEdit_PresentNationality" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Pincode:</div>
                                                        <div class="text lblpresent" id="lblpresentpincode"></div>
                                                        <div class="text txtpresent">
                                                            <input type="text" id="txtEdit_PresentPincode" />
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div id="PermanentAddressControls">
                                            <div class="info">
                                                <ul class="rows">
                                                    <li class="col-md-12">
                                                        <div class="title">Address:</div>
                                                        <div class="text lblpermanent" id="lblpermanentAddress"></div>
                                                        <div class="text txtpermanent">
                                                            <textarea name="address" class="textarea-tl" id="txtEdit_PermanentAddress" style="resize: none; height: 35px;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">State:</div>
                                                        <div class="text lblpermanent" id="lblPermanentState"></div>
                                                        <div class="text txtpermanent">
                                                            <input type="text" id="txtEditPermanentState" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">City:</div>
                                                        <div class="text lblpermanent" id="lblPermanentCity"></div>
                                                        <div class="text txtpermanent">
                                                            <input type="text" id="txtEditPermanentCity" />
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">Country:</div>
                                                        <div class="text lblpermanent" id="lblPermanentCountry"></div>
                                                        <div class="text txtpermanent">
                                                            <input type="text" id="txtEdit_PermanentCountry" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Nationality:</div>
                                                        <div class="text lblpermanent" id="lblPermanentNationality"></div>
                                                        <div class="text txtpermanent">
                                                            <input type="text" id="txtEdit_PermanentNationality" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Pincode:</div>
                                                        <div class="text lblpermanent" id="lblPermanentPincode"></div>
                                                        <div class="text txtpermanent">
                                                            <input type="text" id="txtEdit_PermanentPincode" />
                                                        </div>
                                                    </li>
                                                </ul>

                                            </div>
                                        </div>

                                        <div id="MailingAddressControls">
                                            <div class="info">
                                                <ul class="rows">
                                                    <li class="col-md-12">
                                                        <div class="title">Address:</div>
                                                        <div class="text lblmailing" id="lblMailingAddress"></div>
                                                        <div class="text txtmailing">
                                                            <textarea name="address" class="textarea-tl" id="txtEditMailingAddress" style="resize: none; height: 35px;" onkeypress="return ValidateCharacters(9);"></textarea>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">State:</div>
                                                        <div class="text lblmailing" id="lblMailingState"></div>
                                                        <div class="text txtmailing">
                                                            <input type="text" id="txtEditMailingState" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">City:</div>
                                                        <div class="text lblmailing" id="lblMailingCity"></div>
                                                        <div class="text txtmailing">
                                                            <input type="text" id="txtEditMailingCity" />
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="rows">
                                                    <li class="col-md-6">
                                                        <div class="title">Country:</div>
                                                        <div class="text lblmailing" id="lblMailingCountry"></div>
                                                        <div class="text txtmailing">
                                                            <input type="text" id="txtEditMailingCountry" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Nationality:</div>
                                                        <div class="text lblmailing" id="lblMailingNationality"></div>
                                                        <div class="text txtmailing">
                                                            <input type="text" id="txtEditMailingNationality" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-6">
                                                        <div class="title">Pincode:</div>
                                                        <div class="text lblmailing" id="lblMailingPincode"></div>
                                                        <div class="text txtmailing">
                                                            <input type="text" id="txtEditMailingPincode" />
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff; cursor: pointer;" id="dvPresentAddress">
                                                <div class="" style="height: 40px;">
                                                    <div class="mCustomScrollBox mCS-light" id="Div4" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                                        <div class="mCSB_container" style="position: relative; top: 0px;">
                                                            <div class="item">
                                                                <b>Present Address</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff; cursor: pointer;" id="dvPermanentAddress">
                                                <div class="" style="height: 40px;">
                                                    <div class="mCustomScrollBox mCS-light" id="Div5" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                                        <div class="mCSB_container" style="position: relative; top: 0px;">
                                                            <div class="item">
                                                                <b>Permanent Address</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff; cursor: pointer;" id="dvMailingAddress">
                                                <div class="" style="height: 40px;">
                                                    <div class="mCustomScrollBox mCS-light" id="Div6" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                                        <div class="mCSB_container" style="position: relative; top: 0px;">
                                                            <div class="item">
                                                                <b>Mailing Address</b>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 15px;">
                            <div class="mCustomScrollBox mCS-light" id="Div11" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b>Professional Information</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4" id="dvworkExperience">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 228px;">
                            <div class="mCustomScrollBox mCS-light" id="Div7" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;">
                                    <div class="item">
                                        <b>Work Experience</b>
                                        <button class="btn btn-link pull-right" type="button" id="Btn_WorkExp_Edit" onclick="WorkExperience_Edit();"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                        <button class="btn btn-link pull-right" type="button" id="Btn_WorkExp_Save"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="Btn_WorkExp_Cancel" onclick="WorkExp_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                    </div>
                                    <div class="info">
                                        <ul class="rows">
                                            <li>
                                                <div class="title">Company:</div>
                                                <div class="text Workview" id="lblwork_Company"></div>
                                                <div class="text txtWorkview">
                                                    <input type="text" id="txtwork_company" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Designation:</div>
                                                <div class="text Workview" id="lblwork_Designation"></div>
                                                <div class="text txtWorkview">
                                                    <input type="text" id="txtwork_Designation" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Year of Experience:</div>
                                                <div class="text Workview" id="lblwork_Exp"></div>
                                                <div class="text txtWorkview">
                                                    <input type="text" id="txtwork_Exp" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Skills:</div>
                                                <div class="text Workview" id="lblwork_Skill"></div>
                                                <div class="text txtWorkview">
                                                    <input type="text" id="txtwork_Skill" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Date of Joining:</div>
                                                <div class="text Workview" id="lblwork_DOJ"></div>
                                                <div class="text txtWorkview">
                                                    <div class="input-group datepicker-custom">
                                                        <input id="txtwork_DOJ" name="off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                        <span class="input-group-addon" style="top: 0px;"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Date of Leaving:</div>
                                                <div class="text Workview" id="lblwork_DOL"></div>
                                                <div class="text txtWorkview">
                                                    <div class="input-group datepicker-custom">
                                                        <input id="txtwork_DOL" name="off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                        <span class="input-group-addon" style="top: 0px;"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: 205px;">
                            <div class="mCustomScrollBox mCS-light" id="Div8" style="position: relative; height: 100%; overflow: hidden; max-width: 100%">
                                <div class="mCSB_container" style="position: relative; top: 0px; width: 100%;">
                                    <div class="item">
                                        <b>Education Details</b>
                                        <button class="btn btn-link pull-right" type="button" id="btn_EducationEdit" onclick="JsonEmpty_EducationEdit();"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_EducationEmptySave"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_EducationEmptyCancel" onclick="JsonEmpty_EducationCancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_Education_Save"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                        <button class="btn btn-link pull-right" type="button" id="btn_Education_Cancel" onclick="Education_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                    </div>
                                    <br />
                                    <div class="info" id="dvEducationTable">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="block-fluid" style="width: 100%;">
                                                    <table cellpadding="0" cellspacing="0" class="table" id="tblEducation_edit">
                                                        <thead>
                                                            <tr>
                                                                <th>Qualification</th>
                                                                <th>Institute Name</th>
                                                                <th>Year of Passing</th>
                                                                <th>Percentage</th>
                                                                <th>Edit</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%--<tr>
                                                                <td>
                                                                    <div class="text" id="lbledu_Qualification"></div>
                                                                </td>
                                                                <td>
                                                                    <div class="text" id="lbledu_InstituteName"></div>
                                                                </td>
                                                                <td>
                                                                    <div class="text" id="lbledu_Yearofpassing"></div>
                                                                </td>
                                                                <td>
                                                                    <div class="text" id="lbledu_Percentage"></div>
                                                                </td>
                                                                <td style="width: 5px;">
                                                                    <div class="text">
                                                                        <button class="btn btn-link" type="button" id="EditEducation" onclick="Edit_Education();"><i class="glyphicon glyphicon-edit"></i></button>
                                                                    </div>
                                                                </td>
                                                            </tr>--%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="dvEducationEdit" class="info">
                                        <ul class="rows">
                                            <li class="showEduEdit">
                                                <div class="title">Qualification:</div>
                                                <div class="text">
                                                    <input type="text" id="txtQualiEdit" />
                                                </div>
                                            </li>
                                            <li class="showEduEdit">
                                                <div class="title">Institute Name:</div>
                                                <div class="text">
                                                    <input type="text" id="txtInstituteEdit" />
                                                </div>
                                            </li>
                                            <li class="showEduEdit">
                                                <div class="title">Year of Passing:</div>
                                                <div class="text">
                                                    <input type="text" id="txtYearPassingEdit" />
                                                </div>
                                            </li>
                                            <li class="showEduEdit">
                                                <div class="title">Percentage:</div>
                                                <div class="text">
                                                    <input type="text" id="txtPercentageEdit" />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="dvOfficial">
                <div class="col-md-12">
                    <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                        <div class="" style="height: auto;">
                            <div class="mCustomScrollBox mCS-light" id="Div9" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                                <div class="mCSB_container" style="position: relative; top: 0px;"></div>
                                <div class="item">
                                    <b>Official Details</b>
                                </div>
                                <div class="info">
                                    <div class="block-fluid accordion">

                                        <h3>Official Details
                                            <button class="btn btn-link pull-right" type="button" id="Btn_Office_edit" onclick="Office_Edit();" style="margin-top: -5px;"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                            <button class="btn btn-link pull-right" type="button" id="Btn_Office_Save"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                            <button class="btn btn-link pull-right" type="button" id="Btn_Office_Cancel" onclick="OfficeEdit_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                        </h3>

                                        <div class="info">
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">Date of Joining:</div>
                                                        <div class="text lbloffice" id="lbloff_doj"></div>
                                                        <div class="text txtofficebank">
                                                            <div class="input-group datepicker-custom">
                                                                <input id="txtoff_Editdoj" name="off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                                <span class="input-group-addon" style="top: 0px; height: 22px;"><i class="glyphicon glyphicon-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Date of Leaving:</div>
                                                        <div class="text lbloffice" id="lbloff_dol"></div>
                                                        <div class="text txtofficebank">
                                                            <div class="input-group datepicker-custom">
                                                                <input id="txtoff_Editdol" name="off_doj" type="text" placeholder="DD-MM-YYYY" />
                                                                <span class="input-group-addon" style="top: 0px; height: 22px;"><i class="glyphicon glyphicon-calendar"></i></span>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Designation:</div>
                                                        <div class="text lbloffice" id="lbloff_designation"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_Editdesignation" />
                                                        </div>
                                                    </li>

                                                    <li class="col-md-3">
                                                        <div class="title">PF Capping:</div>
                                                        <div class="text lbloffice" id="lblpf_capping"></div>
                                                        <div class="text txtofficebank" id="dvpfcapping">
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editpfcapping_Y" value="Y" name="rbpfcappingEdit" />Yes                                   
                                                            </label>
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editpfcapping_N" value="N" name="rbpfcappingEdit" />No                                   
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">Department:</div>
                                                        <div class="text lbloffice" id="lbloff_department"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_Editdepartment" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">PO No:</div>
                                                        <div class="text lbloffice" id="lbloff_PoNo"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditPoNo" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Branch:</div>
                                                        <div class="text lbloffice" id="lbloff_Branch"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditBranch" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">ESI Contribution:</div>
                                                        <div class="text lbloffice" id="lblrbesi_Edit"></div>
                                                        <div class="text txtofficebank" id="dvesicontribution">
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editesi_y" value="Y" name="rbesi_Edit" />Yes                                   
                                                            </label>
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editesi_n" value="N" name="rbesi_Edit" />No                                   
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">

                                                    <li class="col-md-3">
                                                        <div class="title">Job Location:</div>
                                                        <div class="text lbloffice" id="lbloff_joblocation"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_Editjoblocation" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Cost Center:</div>
                                                        <div class="text lbloffice" id="lbloff_CostCenter"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditCostCenter" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Category:</div>
                                                        <div class="text lbloffice" id="lbloff_Category"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditCategory" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">PF Contribution:</div>
                                                        <div class="text lbloffice" id="lbledit_pfcontribution"></div>
                                                        <div class="text txtofficebank" id="dvpfcontribution">
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="rbpfedit_Y" value="Y" name="rbpfcontri_edit" />Yes                                   
                                                            </label>
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="rbpfedit_N" value="N" name="rbpfcontri_edit" />No                                   
                                                            </label>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">

                                                    <li class="col-md-3">
                                                        <div class="title">PT State:</div>
                                                        <div class="text lbloffice" id="lbloff_PTstate"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditPtstate" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">ESI No:</div>
                                                        <div class="text lbloffice" id="lbloff_ESINO"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditESIno" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Aadhar No:</div>
                                                        <div class="text lbloffice" id="lbloff_AadharNo"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditAadharno" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Handicap:</div>
                                                        <div class="text lbloffice" id="lblhandicap_edit"></div>
                                                        <div class="text txtofficebank" id="dvhandicap">
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editHandicap_Y" value="Y" name="rbhandicapEdit" />Yes                                   
                                                            </label>
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="editHandicap_N" value="N" name="rbhandicapEdit" />No                                   
                                                            </label>
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">PF UAN No:</div>
                                                        <div class="text lbloffice" id="lbloff_Pfuan"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditPfUan" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Passport No:</div>
                                                        <div class="text lbloffice" id="lbloff_Passport"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_Editpassport" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">DL No:</div>
                                                        <div class="text lbloffice" id="lbloff_DLno"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditDLno" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Senior Citizen:</div>
                                                        <div class="text lbloffice" id="lbledit_seniorcitizen"></div>
                                                        <div class="text txtofficebank" id="dvseniorcitizen">
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="rbscedit_Y" value="Y" name="rbsc_edit" />Yes                                   
                                                            </label>
                                                            <label class="checkbox checkbox-inline">
                                                                <input type="radio" id="rbscedit_N" value="N" name="rbsc_edit" />No                                   
                                                            </label>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">PAN No:</div>
                                                        <div class="text lbloffice" id="lbloff_PANno"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_EditPANno" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">City:</div>
                                                        <div class="text lbloffice" id="lbloff_city"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_Editcity" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">State:</div>
                                                        <div class="text lbloffice" id="lbloff_state"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_editstate" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Country:</div>
                                                        <div class="text lbloffice" id="lbloff_country"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_editCountry" style="width: 62%;" />
                                                        </div>
                                                    </li>

                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">Pincode:</div>
                                                        <div class="text lbloffice" id="lbloff_pincode"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_editpincode" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-9">
                                                        <div class="title">Address:</div>
                                                        <div class="text lbloffice" id="lbloff_address"></div>
                                                        <div class="text txtofficebank">
                                                            <input type="text" id="txtoff_editAddress" />
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <h3>Bank Details
                                             <button class="btn btn-link pull-right" type="button" id="Btn_Bank_Edit" onclick="Bank_Edit();" style="margin-top: -5px;"><i class="glyphicon glyphicon-edit"></i>&nbsp;Edit</button>
                                            <button class="btn btn-link pull-right" type="button" id="Btn_Bank_Save"><i class="glyphicon glyphicon-list-alt"></i>&nbsp;Save</button>
                                            <button class="btn btn-link pull-right" type="button" id="Btn_Bank_Cancel" onclick="BankEdit_Cancel();"><i class="glyphicon glyphicon-remove"></i>&nbsp;Cancel</button>
                                        </h3>
                                        <div class="info">
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">IFSC Code:</div>
                                                        <div class="text lblbank" id="lblbankifsccode"></div>
                                                        <div class="text txtbank">
                                                            <input type="text" id="txtbank_editifsccode" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Account No:</div>
                                                        <div class="text lblbank" id="lblbank_acc"></div>
                                                        <div class="text txtbank">
                                                            <input type="text" id="txtbank_editAccount" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Payment Mode:</div>
                                                        <div class="text lblbank" id="lblpaymentmode"></div>
                                                        <div class="text txtbank">
                                                            <select name="saluation" id="ddleditpaymentmode" style="width: 85%;">
                                                            </select>
                                                        </div>
                                                    </li>
                                                    <li class="col-md-3">
                                                        <div class="title">Bank Name:</div>
                                                        <div class="text lblbank" id="lblbank_name"></div>
                                                        <div class="text txtbank">
                                                            <input type="text" id="txtbank_editname" style="width: 62%;" />
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="row">
                                                <ul class="rows">
                                                    <li class="col-md-3">
                                                        <div class="title">Bank Branch:</div>
                                                        <div class="text lblbank" id="lblbankbranch"></div>
                                                        <div class="text txtbank">
                                                            <input type="text" id="txtbank_editBranch" />
                                                        </div>
                                                    </li>
                                                    <li class="col-md-9">
                                                        <div class="title">Address:</div>
                                                        <div class="text lblbank" id="lblbankaddress"></div>
                                                        <div class="text txtbank">
                                                            <input type="text" id="txtbank_editaddress" />
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div>
        <input type="text" id="txtHiddenEmpid" style="display: none;" />
    </div>
</asp:Content>
