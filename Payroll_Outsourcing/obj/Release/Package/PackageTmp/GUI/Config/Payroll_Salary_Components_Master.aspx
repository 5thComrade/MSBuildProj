<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Config/Payroll_Config.master" AutoEventWireup="true" CodeBehind="Payroll_Salary_Components_Master.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Config.Payroll_Salary_Components_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            ShowHide_Div_Controls();
            Bind_Client();
            ClearSalaryViewControls();
            BindGetSalaryComponents();
            gridExportBind();
            CallAddSalary_Component();
            EventGoBack();
            Bind_ComponentType();
            SaveSalaryComponents();
            Bind_EditComponentType();
            Bind_EditPayComponent();
            UpdateSalaryComponent_Properties_Insert();
            SalaryComponentView_Cancel();
            Cancel_View();
        });

        function ShowHide_Div_Controls() {
            $('#SalaryComponentProperties').hide();
            $('#SalaryComponentView').hide();
        }

        function Bind_Client() {
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

        function BindGetSalaryComponents() {
            $('#spGridSalary').show();
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetSalaryComponents",
                data: "{Option:'All',CM_ID:''}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d.length > 0) {
                        $('#divComponentMasterBind').w2grid({
                            name: 'divComponentMaster',
                            method: 'GET',
                            columns: [
                                { field: 'CM_NAME', caption: 'Name', size: '30%', sortable: true },
                                { field: 'CM_DESC', caption: 'Description', size: '40%', sortable: true },
                                { field: 'CLV_VALUE', caption: 'Type', size: '30%', sortable: true },
                                { field: 'CM_STATUS', caption: 'Status', size: '30%', sortable: true }
                            ],
                            searches: [
                                { type: 'text', field: 'CM_SEARCH_VALUE', caption: 'Name' },
                                { type: 'text', field: 'CLV_VALUE', caption: 'Type' }
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
                        w2ui['divComponentMaster'].autoLoad = true;
                        var myObject = data.d;
                        myObject = myObject.replace(/(<([^>]+)>)/ig, "");
                        $('#dvExport').text(myObject);
                    }
                    $('#spGridSalary').hide();
                },
                failure: function (response) {
                    $('#spGridSalary').hide();
                    notify_e("Error", "Unable to load component details.");
                }
            });
        }

        var SalaryComponentMaster = [{
            SlNo: "", ComponentName: "", ComponentDescription: "", ComponentType: "", IfApplicable: "", IfFullComponent: "",
            CarryForwardLastValue: "", ProratedComponent: "", ConsiderForArrears: "", ConsiderForPF: "", ConsiderForESIC: "", ConsiderForPT: "",
            ConsiderAsTDSComponent: "", ConsiderForTDSEstimation: "", AdhocIncome: "", ProfitInLieuOfSalary: "", ValueType: ""
        }];

        function DownloadBlankSalaryTemplate() {
            var data, filename, link;
            var csv = convertArrayOfObjectsToCSV({
                data: SalaryComponentMaster
            });
            if (csv == null) return;
            filename = 'SalaryComponent.csv';
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

        function CallAddSalary_Component() {
            $('#CallAddComponent').click(function () {
                $('#GridSalary').hide();
                $('#SalaryComponentProperties').show();
            });
        }

        function EventGoBack() {
            $('#GoBack').click(function () {
                $('#GridSalary').show();
                $('#SalaryComponentProperties').hide();
            });
        }

        function Bind_ComponentType() {
            $('[id$=ddlComponentType]').empty();
            $('[id$=ddlComponentType]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Component_Type'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlComponentType]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlComponentType]').select2();
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to load component type.');
                }
            });
        }

        function setfilename(val) {
            var fileName = val.substr(val.lastIndexOf("\\") + 1, val.length);
            document.getElementById("path").value = fileName;
        }

        function reset() {
            document.getElementById("path").value = '';
        }

        function UploadMassDetails() {
            if ($('#path').val() == "") {
                notify_e("Error", "Please select file.");
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
                        var corrdata = CSVtoJSONforSalaryMassInsert(fr.result);
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
                        if (arrayLength == "") {
                            TemplateName = "";
                        }
                        else if (arrayLength == 17) {
                            TemplateName = "SalaryMaster";
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
                                $.ajax({
                                    url: "/Handler/FileUploadHandler.ashx?Option=SalaryMaster",
                                    type: "POST",
                                    data: data,
                                    contentType: false,
                                    processData: false,
                                    success: function (result) {
                                        if (result == "Success") {
                                            InsertSalaryComponentBulk(JsonData, TemplateName)
                                        }
                                    },
                                    error: function (err) {
                                        // $('#spinner').hide();
                                        notify_e("Error", "Unable to find path..");
                                    }
                                });
                            }
                            else {
                                notify_e("Error", "You are trying to upload a blank template.");
                            }
                        }
                        else {
                            notify_e("Error", "Invalid Template.");
                        }
                    }
                }
            }
        }

        function InsertSalaryComponentBulk(JsonData, TemplateName) {
            $.ajax({
                type: "POST",
                data: "{JsonData:'" + JsonData + "',Option:'" + TemplateName + "'}",
                url: "../WebServices/Payroll_Webservices.asmx/SalaryComponents_MassInsert",
                contentType: "application/json",
                success: function (data) {
                    $("#tblSalaryComponentError tbody").html("");
                    for (var i = 0; i < data.d.length; i++) {
                        if (data.d[0].Errorlines != "" && data.d[0].ErrorMessage != "") {
                            $("#tblSalaryComponentError tbody").append(
                            '<tr>'
                            + '<td>' + data.d[i].ErrorMessage + '</td>'
                            + '<td>' + data.d[i].Errorlines + '</td>'
                            + '</tr>'
                      );
                            $('#tblSalaryComponentError').show();
                            $.pnotify({
                                title: 'Error',
                                text: 'Unbale to upload..' + '<div><a href="#" onclick="Download_UplaodError();" id="EmpErrorDetails">Download error details</a></div>' + '',
                                opacity: .8,
                                type: 'error'
                            });
                            $('#tblSalaryComponentError').hide();
                            $('#path').val('');
                            w2ui['divComponentMaster'].destroy();
                            BindGetSalaryComponents();
                            //$('#spinner').hide();
                        }
                        else if (data.d[0].ErrorMessage != "") {
                            notify_s("Success", data.d[0].ErrorMessage);
                            //$('#spinner').hide();
                            $('#path').val('');
                            w2ui['divComponentMaster'].destroy();
                            BindGetSalaryComponents();
                        }
                    }
                },
                error: function (xhr, textStatus, errorThrown) {
                    notify_e("Error", "Unable to upload file.");
                    //$('#spinner').hide();
                }
            });
        }

        function Download_UplaodError() {
            tableToExcel("tblSalaryComponentError", "SalaryComponentError");
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

        var template = {
            "SalaryMaster": ["SlNo", "ComponentName", "ComponentDescription", "ComponentType", "IfApplicable", "IfFullComponent",
                            "CarryForwardLastValue", "ProratedComponent", "ConsiderForArrears", "ConsiderForPF", "ConsiderForESIC", "ConsiderForPT",
                            "ConsiderAsTDSComponent", "ConsiderForTDSEstimation", "AdhocIncome", "ProfitInLieuOfSalary", "ValueType"]
        };

        function CSVtoJSONforSalaryMassInsert(csv) {
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
                    (value["ComponentName"] != null && $.trim(value["ComponentName"]) != '[FILLEDDATA]' && value["ComponentName"].length > 0) ||
                    (value["ComponentDescription"] != null && $.trim(value["ComponentDescription"]) != '[1-31]' && value["ComponentDescription"].length > 0) ||
                    (value["ComponentType"] != null && $.trim(value["ComponentType"]) != '[FILLEDDATA]' && value["ComponentType"].length > 0) ||
                    //(value["Status"] != null && $.trim(value["Status"]) != '[FILLEDDATA]' && value["Status"].length > 0) ||
                    (value["IfApplicable"] != null && $.trim(value["IfApplicable"]) != '[FILLEDDATA]' && value["IfApplicable"].length > 0) ||
                    (value["IfFullComponent"] != null && $.trim(value["IfFullComponent"]) != '[FILLEDDATA]' && value["IfFullComponent"].length > 0) ||
                    (value["CarryForwardLastValue"] != null && $.trim(value["CarryForwardLastValue"]) != '[FILLEDDATA]' && value["CarryForwardLastValue"].length > 0) ||
                    (value["ProratedComponent"] != null && $.trim(value["ProratedComponent"]) != '[FILLEDDATA]' && value["ProratedComponent"].length > 0) ||
                    (value["ConsiderForArrears"] != null && $.trim(value["ConsiderForArrears"]) != '[FILLEDDATA]' && value["ConsiderForArrears"].length > 0) ||
                    (value["ConsiderForPF"] != null && $.trim(value["ConsiderForPF"]) != '[FILLEDDATA]' && value["ConsiderForPF"].length > 0) ||
                    (value["ConsiderForESIC"] != null && $.trim(value["ConsiderForESIC"]) != '[FILLEDDATA]' && value["ConsiderForESIC"].length > 0) ||
                    (value["ConsiderForPT"] != null && $.trim(value["ConsiderForPT"]) != '[FILLEDDATA]' && value["ConsiderForPT"].length > 0) ||
                    (value["ConsiderAsTDSComponent"] != null && $.trim(value["ConsiderAsTDSComponent"]) != '[FILLEDDATA]' && value["ConsiderAsTDSComponent"].length > 0) ||
                    (value["ConsiderForTDSEstimation"] != null && $.trim(value["ConsiderForTDSEstimation"]) != '[FILLEDDATA]' && value["ConsiderForTDSEstimation"].length > 0) ||
                    (value["AdhocIncome"] != null && $.trim(value["AdhocIncome"]) != '[FILLEDDATA]' && value["AdhocIncome"].length > 0) ||
                    (value["ProfitInLieuOfSalary"] != null && $.trim(value["ProfitInLieuOfSalary"]) != '[FILLEDDATA]' && value["ProfitInLieuOfSalary"].length > 0) ||
                    (value["ValueType"] != null && $.trim(value["ValueType"]) != '[FILLEDDATA]' && value["ValueType"].length > 0) ||
                    (value["TDSEstimation"] != null && $.trim(value["TDSEstimation"]) != '[FILLEDDATA]' && value["TDSEstimation"].length > 0)) {

                    var myObject = new Object();
                    myObject.SlNo = value["SlNo"];
                    myObject.ComponentName = value["ComponentName"];
                    myObject.ComponentDescription = value["ComponentDescription"];
                    myObject.ComponentType = value["ComponentType"];
                    // myObject.Status = value["Status"];
                    myObject.IfApplicable = value["IfApplicable"];
                    myObject.IfFullComponent = value["IfFullComponent"];
                    myObject.CarryForwardLastValue = value["CarryForwardLastValue"];
                    myObject.ProratedComponent = value["ProratedComponent"];
                    myObject.ConsiderForArrears = value["ConsiderForArrears"];
                    myObject.ConsiderForPF = value["ConsiderForPF"];
                    myObject.ConsiderForESIC = value["ConsiderForESIC"];
                    myObject.ConsiderForPT = value["ConsiderForPT"];
                    myObject.ConsiderAsTDSComponent = value["ConsiderAsTDSComponent"];
                    myObject.ConsiderForTDSEstimation = value["ConsiderForTDSEstimation"];
                    myObject.AdhocIncome = value["AdhocIncome"];
                    myObject.ProfitInLieuOfSalary = value["ProfitInLieuOfSalary"];
                    myObject.ValueType = value["ValueType"];
                    myObject.TDSEstimation = value["TDSEstimation"];
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

        function Validate_SalaryComponents() {
            var multiselected = $('.multiselect > option:selected');
            if ($('#txtComponentName').val() == '') {
                notify_e("Error", "Please enter component name.");
                $('#txtComponentName').focus();
                return false;
            }
            else if ($('#txtComponentDescription').val() == '') {
                notify_e("Error", "Please enter component description.");
                $('#txtComponentDescription').focus();
                return false;
            }
            else if ($('#ddlComponentType option:selected').val() == 0) {
                notify_e("Error", "Please select component type.");
                $('#ddlComponentType').focus();
                return false;
            }
            else if ($('#txtComponentValueType').val() == '') {
                notify_e("Error", "Please enter component value type.");
                $('#txtComponentValueType').focus();
                return false;
            }
            else if (multiselected.length == 0) {
                notify_e("Error", "Please select any pay component.");
                $('#fmultiselect').focus();
                return false;
            }
            else {
                return true;
            }
        }

        function GetParam() {
            var Applicable = 'No';
            var FC = 'No';
            var COMP = 'No';
            var PRO_COMP = 'No';
            var ARREARS = 'No';
            var PF = 'No';
            var ESIC = 'No';
            var PT = 'No';
            var TDS_GROSS = 'No';
            var ADHOC = 'No';
            var PROFIT = 'No';
            var TDS_EST = 'No';
            var PayComponent_Option = [];
            $.each($(".multiselect option:selected"), function () {
                PayComponent_Option.push($(this).val());
            });
            var SelectedOption = PayComponent_Option;
            for (var i = 0; i < PayComponent_Option.length; i++) {
                if (SelectedOption[i] == "CM_APPLICABLE") {
                    Applicable = 'A';
                }
                else {
                    Applicable;
                }
                if (SelectedOption[i] == "CM_FC") {
                    FC = 'FC';
                }
                else {
                    FC;
                }
                if (SelectedOption[i] == "CM_CF_COMP") {
                    COMP = 'Yes';
                }
                else {
                    COMP;
                }
                if (SelectedOption[i] == "CM_PRORATED_COMP") {
                    PRO_COMP = 'Yes';
                }
                else {
                    PRO_COMP;
                }
                if (SelectedOption[i] == "CM_ARREARS") {
                    ARREARS = 'Yes';
                }
                else {
                    ARREARS;
                }
                if (SelectedOption[i] == "CM_PF") {
                    PF = 'Yes';
                }
                else {
                    PF;
                }
                if (SelectedOption[i] == "CM_ESIC") {
                    ESIC = 'Yes';
                }
                else {
                    ESIC;
                }
                if (SelectedOption[i] == "CM_PT") {
                    PT = 'Yes';
                }
                else {
                    PT;
                }
                if (SelectedOption[i] == "CM_TDS_GROSS") {
                    TDS_GROSS = 'Yes';
                }
                else {
                    TDS_GROSS;
                }
                if (SelectedOption[i] == "CM_ADHOC") {
                    ADHOC = 'Yes';
                }
                else {
                    ADHOC;
                }
                if (SelectedOption[i] == "CM_PROFIT") {
                    PROFIT = 'Yes';
                }
                else {
                    PROFIT;
                }
                if (SelectedOption[i] == "CM_TDS_EST") {
                    TDS_EST = 'Yes';
                }
                else {
                    TDS_EST;
                }
            }
            var params =
            "{CM_NAME:'" + $('#txtComponentName').val()
            + "',CM_DESC:'" + $('#txtComponentDescription').val()
            + "',CM_TYPE:'" + $('#ddlComponentType option:selected').val()
            + "',CM_VALUE_TYPE:'" + $('#txtComponentValueType').val()
            + "',CM_APPLICABLE:'" + Applicable
            + "',CM_FC:'" + FC
            + "',CM_CF_COMP:'" + COMP
            + "',CM_PRORATED_COMP:'" + PRO_COMP
            + "',CM_ARREARS:'" + ARREARS
            + "',CM_PF:'" + PF
            + "',CM_ESIC:'" + ESIC
            + "',CM_PT:'" + PT
            + "',CM_TDS_GROSS:'" + TDS_GROSS
            + "',CM_ADHOC:'" + ADHOC
            + "',CM_PROFIT:'" + PROFIT
            + "',CM_TDS_EST:'" + TDS_EST
            + "',CM_CREATED_BY:'" + 'Admin'
            + "'}";
            return params;
        }

        function SalaryComponents_Insert() {
            var boolflag = false;
            var parameters = GetParam();
            boolflag = Validate_SalaryComponents();
            if (boolflag == true) {
                //$('#spinner').show();
                $.ajax({
                    type: "POST",
                    url: "../WebServices/Payroll_Webservices.asmx/SalaryComponents_Insert",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "Success.") {
                            notify_s("Success", "Data uploaded successfully.");
                            ClearSalaryComponentControl();
                            $('#SalaryComponentProperties').hide();
                            $('#GridSalary').show();
                            w2ui['divComponentMaster'].destroy();
                            BindGetSalaryComponents();
                            //$('#spinner').hide();
                        }
                        else {
                            notify_e("Error", data.d);
                            //$('#spinner').hide();
                        }
                    },
                    failure: function (response) {
                        notify_e("Error", "Error while uploading details.");
                        //$('#spinner').hide();
                    }
                });
            }
        }

        function SaveSalaryComponents() {
            $("#btnsave_salarycomponent").click(function (event) {
                SalaryComponents_Insert();
            });
        }

        function gridExportBind() {
            var array = $('#dvExport').text();
            $("#gridExport").click(function (event) {
                CreateTableFromJSON();
            });
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

        function ClearSalaryComponentControl() {
            $('#txtComponentName').val('');
            $('#txtComponentDescription').val('');
            $('#txtComponentValueType').val('');
            $("#ddlComponentType").select2('val', '0');
            $('#fmultiselect').multiSelect('deselect_all');
        }

        function Bind_EditComponentType() {
            $('[id$=ddlEditComponentType]').empty();
            $('[id$=ddlEditComponentType]').append('<option value="0">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Component_Type'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlEditComponentType]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlEditComponentType]').select2();
                    }
                },
                failure: function (response) {
                    notify_e('Error', 'Unable to load component type.');
                }
            });
        }

        function Bind_EditPayComponent() {
            if ($("#PayComponent").length > 0) {
                $("#PayComponent").multiSelect({
                    selectableHeader: "<div class='multipleselect-header'>Selectable item</div>",
                    selectedHeader: "<div class='multipleselect-header'>Selected items</div>",
                });
                $('#PayComponent_SelectAll').click(function () {
                    $('#PayComponent').multiSelect('select_all');
                    return false;
                });
                $('#PayComponent_DeselectAll').click(function () {
                    $('#PayComponent').multiSelect('deselect_all');
                    return false;
                });
            }
        }

        function ComponentsView(CM_ID, Option, CM_NAME) {
            if (Option == "V") {
                BindSpecificComponents(CM_ID, CM_NAME)
                ShowSalaryComponent_View();
            }
            else {

            }
        }

        function bindMultiselectData(BindData) {
            for (var i = 0; i < $("#ms-PayComponent .ms-selectable .ms-list li").length; i++) {
                if ($('#ms-PayComponent .ms-selectable .ms-list li:eq(' + i + ')').text() == BindData) {
                    $("#ms-PayComponent .ms-selectable .ms-list li:eq(" + i + ")").removeClass("ms-elem-selectable").addClass("ms-elem-selectable ms-hover ms-selected").css("display", "none");
                    $("#ms-PayComponent .ms-selection .ms-list li:eq(" + i + ")").addClass("ms-elem-selection ms-selected").removeAttr("style");
                }
            }
        }

        var COMP_ID = '';
        function BindSpecificComponents(CM_ID, CM_NAME) {
            COMP_ID = CM_ID;
            //$('#ms-PayComponent').multiSelect('destroy');                     
            //$('#ms-PayComponent').multiSelect('refresh');
            $("#ms-PayComponent .ms-selectable .ms-list li").removeClass("ms-hover ms-selected ms-elem-selectable").addClass("ms-elem-selectable").removeAttr("style");
            $("#ms-PayComponent .ms-selection .ms-list li").removeClass("ms-elem-selection ms-selected").addClass("ms-elem-selection").css("display", "none");

            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/BindSpecificComponents",
                data: "{CM_ID:'" + CM_ID + "',CM_NAME:'" + CM_NAME + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var bindValue = '';
                    var optionValue = '';
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('#txtEditComponentName').val(data.d[0].CM_NAME);
                            $('#txtEditComponentDescription').val(data.d[0].CM_DESC);
                            $('#ddlEditComponentType').select2().select2('val', data.d[0].CM_TYPE);
                            $('#txtEditComponentValueType').val(data.d[0].CM_VALUE_TYPE);

                            if (data.d[0].CM_APPLICABLE != "" && data.d[0].CM_APPLICABLE_VALUE == "A") {
                                bindMultiselectData(data.d[0].CM_APPLICABLE);
                            }
                            if (data.d[0].CM_FC != "" && data.d[0].CM_FC_VALUE == "FC") {
                                bindMultiselectData(data.d[0].CM_FC);
                            }
                            if (data.d[0].CM_CF_COMP != "" && data.d[0].CM_CF_COMP_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_CF_COMP);
                            }
                            if (data.d[0].CM_PRORATED_COMP != "" && data.d[0].CM_PRORATED_COMP_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_PRORATED_COMP);
                            }

                            if (data.d[0].CM_ARREARS != "" && data.d[0].CM_ARREARS_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_ARREARS);
                            }
                            if (data.d[0].CM_PF != "" && data.d[0].CM_PF_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_PF);
                            }
                            if (data.d[0].CM_ESIC != "" && data.d[0].CM_ESIC_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_ESIC);
                            }
                            if (data.d[0].CM_PT != "" && data.d[0].CM_PT_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_PT);
                            }
                            if (data.d[0].CM_TDS_GROSS != "" && data.d[0].CM_TDS_GROSS_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_TDS_GROSS);
                            }
                            if (data.d[0].CM_ADHOC != "" && data.d[0].CM_ADHOC_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_ADHOC);
                            }
                            if (data.d[0].CM_PROFIT != "" && data.d[0].CM_PROFIT_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_PROFIT);
                            }
                            if (data.d[0].CM_TDS_EST != "" && data.d[0].CM_TDS_EST_VALUE == "Yes") {
                                bindMultiselectData(data.d[0].CM_TDS_EST);
                            }
                        }
                    }
                },
                failure: function (response) {
                    notify_e("Error", "Unable to load components properties.");
                }
            });
        }

        function ClearSalaryViewControls() {
            $('#txtEditComponentName').val('');
            $('#txtEditComponentDescription').val('');
            $("#ddlEditComponentType").select2('val', '0');
            $('#txtEditComponentValueType').val('');
            $('#PayComponent').multiSelect('deselect_all');
        }

        function GetUpdated_Param() {
            var Applicable = 'No';
            var FC = 'No';
            var COMP = 'No';
            var PRO_COMP = 'No';
            var ARREARS = 'No';
            var PF = 'No';
            var ESIC = 'No';
            var PT = 'No';
            var TDS_GROSS = 'No';
            var ADHOC = 'No';
            var PROFIT = 'No';
            var TDS_EST = 'No';

            for (var i = 0; i < $("#ms-PayComponent .ms-selection .ms-list li").length; i++) {

                var Option = $("#ms-PayComponent .ms-selection .ms-list li:eq(" + i + ").ms-selected");
                if (Option != "[]") {

                    if (Option.text() == "If Applicable(Mention A)") {
                        Applicable = 'A';
                    }

                    if (Option.text() == "If Full Component(Mention FC)") {
                        FC = 'FC';
                    }

                    if (Option.text() == "Carry forward last value(used only for FC)") {
                        COMP = 'Yes';
                    }

                    if (Option.text() == "Prorated component(Gross)") {
                        PRO_COMP = 'Yes';
                    }

                    if (Option.text() == "Consider for arrears(Gross)") {
                        ARREARS = 'Yes';
                    }

                    if (Option.text() == "Consider for PF(Gross)") {
                        PF = 'Yes';
                    }

                    if (Option.text() == "Consider for ESIC(FC&Gross)") {
                        ESIC = 'Yes';
                    }

                    if (Option.text() == "Consider for PT(Gross)") {
                        PT = 'Yes';
                    }

                    if (Option.text() == "Consider as TDS Component(Gross)") {
                        TDS_GROSS = 'Yes';
                    }

                    if (Option.text() == "Adhoc Income(Gross)") {
                        ADHOC = 'Yes';
                    }

                    if (Option.text() == "Profit in lieu of salary(Gross)") {
                        PROFIT = 'Yes';
                    }

                    if (Option.text() == "TDS Estimation(Gross)") {
                        TDS_EST = 'Yes';
                    }

                }
                else {
                    Applicable = 'No';
                    FC = 'No';
                    COMP = 'No';
                    PRO_COMP = 'No';
                    ARREARS = 'No';
                    PF = 'No';
                    ESIC = 'No';
                    PT = 'No';
                    TDS_GROSS = 'No';
                    ADHOC = 'No';
                    PROFIT = 'No';
                    TDS_EST = 'No';
                }
            }


            var params =

           "{CM_ID:'" + COMP_ID
           + "',CM_NAME:'" + $('#txtEditComponentName').val()
           + "',CM_DESC:'" + $('#txtEditComponentDescription').val()
           + "',CM_TYPE:'" + $('#ddlEditComponentType option:selected').val()
           + "',CM_VALUE_TYPE:'" + $('#txtEditComponentValueType').val()
           + "',CM_APPLICABLE:'" + Applicable
           + "',CM_FC:'" + FC
           + "',CM_CF_COMP:'" + COMP
           + "',CM_PRORATED_COMP:'" + PRO_COMP
           + "',CM_ARREARS:'" + ARREARS
           + "',CM_PF:'" + PF
           + "',CM_ESIC:'" + ESIC
           + "',CM_PT:'" + PT
           + "',CM_TDS_GROSS:'" + TDS_GROSS
           + "',CM_ADHOC:'" + ADHOC
           + "',CM_PROFIT:'" + PROFIT
           + "',CM_TDS_EST:'" + TDS_EST
           + "'}";
            return params;
        }

        function Update_SalaryComponent_Properties() {
            var boolflag = false;
            var parameters = GetUpdated_Param();
            boolflag = Validate_SalaryComponentsView();
            if (boolflag == true) {
                //$('#spinner').show();
                $.ajax({
                    type: "POST",
                    url: "../WebServices/Payroll_Webservices.asmx/UpdateSalaryComponent_Properties",
                    data: parameters,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data.d == "UPDATE SUCEESS.") {
                            notify_s("Success", "Data uploaded successfully.");

                            $('#GridSalary').show();
                            w2ui['divComponentMaster'].destroy();
                            BindGetSalaryComponents();
                            //$('#spinner').hide();
                        }
                        else {
                            notify_e("Error", data.d);
                            //$('#spinner').hide();
                        }
                    },
                    failure: function (response) {
                        notify_e("Error", "Error while uploading details.");
                        //$('#spinner').hide();
                    }
                });
            }
        }

        function Validate_SalaryComponentsView() {
            var SelectedOption = $("#ms-PayComponent .ms-selection .ms-list li.ms-selected");

            if ($('#txtEditComponentName').val() == '') {
                notify_e("Error", "Please enter component name.");
                $('#txtEditComponentName').focus();
                return false;
            }
            else if ($('#txtEditComponentDescription').val() == '') {
                notify_e("Error", "Please enter component description.");
                $('#txtEditComponentDescription').focus();
                return false;
            }
            else if ($('#ddlEditComponentType option:selected').val() == 0) {
                notify_e("Error", "Please select component type.");
                $('#ddlEditComponentType').focus();
                return false;
            }
            else if ($('#txtEditComponentValueType').val() == '') {
                notify_e("Error", "Please enter component value type.");
                $('#txtEditComponentValueType').focus();
                return false;
            }
            else if (SelectedOption.length == 0) {
                notify_e("Error", "Please select any pay component.");
                return false;
            }
            else {
                return true;
            }
        }

        function UpdateSalaryComponent_Properties_Insert() {
            $('#btnComponentViewSave').click(function () {
                Update_SalaryComponent_Properties();
            });
        }

        function SalaryComponentView_Cancel() {
            $('#btnComponentCancel').click(function (event) {
                $('#GridSalary').show();
                $('#SalaryComponentView').hide();
            });
        }

        function ShowSalaryComponent_View() {
            $('#GridSalary').hide();
            $('#SalaryComponentView').show();
        }

        function Cancel_View() {
            $('#CancelView').click(function () {
                $('#GridSalary').show();
                $('#SalaryComponentView').hide();
            });
        }

    </script>

    <div class="workplace">
        <div class="row">
            <div class="col-md-4">
                <div class="btn-group">
                    <button data-toggle="dropdown" onclick="DownloadBlankSalaryTemplate();" class="btn btn-default dropdown-toggle">Download Template</button>
                </div>
            </div>
            <div class="col-md-4">
                <div class="input-group pull-right">
                    <input type="file" id="file" style="display: none; background-color: white;" onchange="setfilename(this.value);" class="form-control" />
                    <input class="form-control nrb input-sm" disabled="disabled" id="path" placeholder="No file selected" />
                    <div class="input-group-btn">
                        <button type="button" style="height: 30px; top: -3px;" class="btn btn-primary  btn-iconed btn-sm " onclick="document.getElementById('file').click();" id="my-awesome-dropzone"><span>Browse</span></button>
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
                <div id="GridSalary">
                    <div class="head clearfix">
                        <div class="isw-settings"></div>
                        <h1>Salary Component</h1>
                        <ul class="buttons">
                            <li><a href="#" id="CallAddComponent" title="Add" class="isw-plus"></a></li>
                            <li><a href="#" id="gridExport" title="Export" class="isw-download"></a></li>
                        </ul>
                    </div>
                    <div class="block-fluid">
                        <div class="overlay" id="spGridSalary">
                            <div class="loader "></div>
                        </div>
                        <div class="w2ui-page page-0" style="display: block; top: 30px; bottom: 58px; height: 350px;">
                            <div class="table-responsive">
                                <div id="divComponentMasterBind" style="width: 100%; height: 350px;">
                                </div>
                            </div>
                        </div>
                        <div id="tblErrorEmployee">
                            <div class="table-responsive">
                                <table id="tblSalaryComponentError" class="" style="display: none;">
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

                <div id="SalaryComponentProperties">
                    <div class="head clearfix">
                        <div class="isw-user"></div>
                        <h1>Salary Component Master Properties</h1>
                        <ul class="buttons">
                            <li><a href="#" id="GoBack" class="isw-left_circle"></a></li>
                        </ul>
                    </div>
                    <div class="block-fluid">
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-7">
                                    <b>Pay Components</b>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="block">
                                                <select multiple="multiple" class="multiselect" id="fmultiselect" name="ftest[]">
                                                    <option value="CM_APPLICABLE">If Applicable(Mention A)</option>
                                                    <option value="CM_FC">If Full Component(Mention FC)</option>
                                                    <option value="CM_CF_COMP">Carry forward last value(used only for FC)</option>
                                                    <option value="CM_PRORATED_COMP">Prorated component(Gross)</option>
                                                    <option value="CM_ARREARS">Consider for arrears(Gross)</option>
                                                    <option value="CM_PF">Consider for PF(Gross)</option>
                                                    <option value="CM_ESIC">Consider for ESIC(FC&Gross)</option>
                                                    <option value="CM_PT">Consider for PT(Gross)</option>
                                                    <option value="CM_TDS_GROSS">Consider as TDS Component(Gross)</option>
                                                    <option value="CM_ADHOC">Adhoc Income(Gross)</option>
                                                    <option value="CM_PROFIT">Profit in lieu of salary(Gross)</option>
                                                    <option value="CM_TDS_EST">TDS Estimation(Gross)</option>
                                                </select>
                                                <div class="btn-group">
                                                    <button class="btn btn-default btn-xs" id="multiselect-deselectAll" type="button">Deselect All</button>
                                                    <button class="btn btn-default btn-xs pull-right" id="multiselect-selectAll" type="button">Select All</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-5">
                                    <b>Salary Components</b>
                                    <div class="row">
                                        <div class="col-md-4">Name:</div>
                                        <div class="col-md-8">
                                            <input type="text" id="txtComponentName" />
                                        </div>
                                        <div class="col-md-4">Description:</div>
                                        <div class="col-md-8">
                                            <input type="text" id="txtComponentDescription" />
                                        </div>
                                        <div class="col-md-4">Type:</div>
                                        <div class="col-md-8">
                                            <select name="ComponentType" id="ddlComponentType" style="width: 100%;">
                                            </select>
                                        </div>
                                        <div class="col-md-4">Value Type:</div>
                                        <div class="col-md-8">
                                            <input type="text" id="txtComponentValueType" />
                                        </div>
                                        <div class="col-md-12">
                                            <button id="btnsave_salarycomponent" class="btn btn-success pull-right" type="button">Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="SalaryComponentView">
                    <div class="head clearfix">
                        <div class="isw-user"></div>
                        <h1>Salary Component Properties Details</h1>
                        <ul class="buttons">
                            <li><a href="#" id="CancelView" class="isw-left_circle"></a></li>
                        </ul>
                    </div>
                    <div class="block-fluid">
                        <div class="row-form clearfix">
                            <div class="row">
                                <div class="col-md-7">
                                    <b>Pay Components</b>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="block">
                                                <select multiple="multiple" class="multiselect" id="PayComponent" name="Paytest[]">
                                                    <option value="CM_APPLICABLE">If Applicable(Mention A)</option>
                                                    <option value="CM_FC">If Full Component(Mention FC)</option>
                                                    <option value="CM_CF_COMP">Carry forward last value(used only for FC)</option>
                                                    <option value="CM_PRORATED_COMP">Prorated component(Gross)</option>
                                                    <option value="CM_ARREARS">Consider for arrears(Gross)</option>
                                                    <option value="CM_PF">Consider for PF(Gross)</option>
                                                    <option value="CM_ESIC">Consider for ESIC(FC&Gross)</option>
                                                    <option value="CM_PT">Consider for PT(Gross)</option>
                                                    <option value="CM_TDS_GROSS">Consider as TDS Component(Gross)</option>
                                                    <option value="CM_ADHOC">Adhoc Income(Gross)</option>
                                                    <option value="CM_PROFIT">Profit in lieu of salary(Gross)</option>
                                                    <option value="CM_TDS_EST">TDS Estimation(Gross)</option>
                                                </select>
                                                <div class="btn-group">
                                                    <button class="btn btn-default btn-xs" id="PayComponent_SelectAll" type="button">Select All</button>
                                                    <button class="btn btn-default btn-xs" id="PayComponent_DeselectAll" type="button">Deselect All</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-5">
                                    <b>Salary Components</b>
                                    <div class="row">
                                        <ul class="rows">
                                            <li>
                                                <div class="title">Name:</div>
                                                <div class="text lblname" id="lbloff_department"></div>
                                                <div class="text txtsalaryEdit">
                                                    <input type="text" id="txtEditComponentName" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Description:</div>
                                                <div class="text lblname" id="Div1"></div>
                                                <div class="text txtsalaryEdit">
                                                    <input type="text" id="txtEditComponentDescription" />
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Type:</div>
                                                <div class="text lblname" id="Div2"></div>
                                                <div class="text txtsalaryEdit">
                                                    <select name="ComponentType" id="ddlEditComponentType" style="width: 100%;">
                                                    </select>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="title">Value Type:</div>
                                                <div class="text lblname" id="Div3"></div>
                                                <div class="text txtsalaryEdit">
                                                    <input type="text" id="txtEditComponentValueType" />
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <button type="button" id="btnComponentViewSave" class="btn btn-success pull-right" onclick="return false;" style="margin-right: -15px;">Update</button>
                                        </div>
                                        <div class="col-md-6">
                                            <button class="btn btn-info pull-right" id="btnComponentCancel" type="button" style="margin-right: -9px;">Cancel</button>
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
</asp:Content>
