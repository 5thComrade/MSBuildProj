<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Config/Payroll_Config.master" AutoEventWireup="true" CodeBehind="Payroll_User_Access_Security.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Config.Payroll_User_Access_Security" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dvCreateRole').show();
            $('#dvCreateUsers').hide();
            $('#dvEmailTemplate').hide();
            $('#dvWorkflow').hide();

        });


        function CallDivContent(Option) {
            if (Option == "Role") {
                $('#dvCreateRole').show();
                $('#dvCreateUsers').hide();
                $('#dvEmailTemplate').hide();
                $('#dvWorkflow').hide();
                $('#thHeader').html("Role");
            }
            else if (Option == "User") {
                $('#dvCreateRole').hide();
                $('#dvCreateUsers').show();
                $('#dvEmailTemplate').hide();
                $('#dvWorkflow').hide();
                $('#thHeader').html("User");
            }
            else if (Option == "UDetails") {
                $('#dvCreateRole').hide();
                $('#dvCreateUsers').hide();
                $('#dvEmailTemplate').show();
                $('#dvWorkflow').hide();
                $('#thHeader').html("Users Details");
            }
            else if (Option == "Workflow") {
                $('#dvCreateRole').hide();
                $('#dvCreateUsers').hide();
                $('#dvEmailTemplate').hide();
                $('#dvWorkflow').show();
                $('#thHeader').html("Workflow");
                $('.cleditorMain iframe').css("width", "650px");
                $('.cleditorMain iframe').css("height", "157px");
            }
            else {
            }
        }
    </script>
    <div class="workplace">
        <div class="col-md-12">
            <div class="head clearfix">
                <div class="isw-settings"></div>
                <h1>User Access Security</h1>
            </div>
            <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">

                <div class="scroll mCustomScrollbar _mCS_1" style="height: 430px;">
                    <div class="mCustomScrollBox mCS-light" id="Div3" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                        <div class="mCSB_container" style="position: relative; top: 0px;">
                            <div class="row">

                                <div class="col-md-4" style="border: 1px solid #ccc; height: 430px; overflow-x: hidden;">
                                    <div class="dTree">
                                        <ul>
                                            <li><a href="#">Organisation Users</a></li>
                                            <li><a href="#">Manish Sabarwal</a>
                                                <ul>
                                                    <li><a href="#">Ashok Reddy</a>
                                                        <ul>
                                                            <li><a href="#">Sharanu S Shirol</a>
                                                                <ul>
                                                                    <li><a href="#">Narayana Raju Dandu</a>
                                                                        <ul>
                                                                            <li><a href="#">Chandramouli GM</a></li>
                                                                            <li><a href="#">Ravindra Babu Mundlamuri</a></li>
                                                                            <li><a href="#">Naveen Kumar GM</a></li>
                                                                            <li><a href="#">Sachin</a></li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>

                                                </ul>
                                            </li>
                                        </ul>
                                    </div>


                                </div>

                                <div class="col-md-4" style="border: 1px solid #ccc; height: 430px; left: 1px; width: 66.6%; text-align: center;">
                                    <div class="breadLine" style="width: 100%; margin-left: -15px; position: absolute; z-index: 999;">
                                        <ul class="breadcrumb">
                                            <li style="margin-left: 252px;"><b></b>Document-Approval-Workflow<span class="divider"></span></li>
                                        </ul>
                                    </div>
                                    <br />
                                    <div class="breadLine" style="width: 100%; margin-left: -15px; position: absolute; z-index: 999;">
                                        <ul class="breadcrumb">
                                            <li><a href="#" onclick="CallDivContent('Role')" style="text-decoration: none;">Create Role</a> <span class="divider"></span></li>
                                            <li><a href="#" onclick="CallDivContent('User')" style="text-decoration: none;">Create Users</a> <span class="divider"></span></li>
                                            <li><a href="#" onclick="CallDivContent('UDetails')" style="text-decoration: none;">Users Details</a> <span class="divider"></span></li>
                                            <li><a href="#" onclick="CallDivContent('Workflow')" style="text-decoration: none;">Workflow</a> <span class="divider"></span></li>
                                        </ul>
                                    </div>
                                    <br />
                                    <div style="overflow-x: hidden;">
                                        <table cellpadding="0" cellspacing="0" width="100%" class="table" style="margin-top: 10px;">
                                            <thead>
                                                <tr>
                                                    <th width="100%" id="thHeader">Role</th>
                                                </tr>
                                            </thead>
                                        </table>

                                        <br />

                                        <div id="dvCreateRole">
                                            <div class="row-form clearfix">
                                                <div class="row">
                                                    <div class="col-md-3">Role Name:</div>
                                                    <div class="col-md-4 " style="margin-left: 28px;">
                                                        <input type="text" id="txtComponentName" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">Role Description:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text1" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3" style="margin-left: 94px;">
                                                        <button id="btnsave_salarycomponent" class="btn btn-success pull-right" type="button">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="dvCreateUsers">
                                            <div class="row-form clearfix">

                                                <div class="row">
                                                    <div class="col-md-3">User Name:</div>
                                                    <div class="col-md-4 ">
                                                        <input type="text" id="Text2" style="margin-left: -16px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">Password:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text3" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">Email:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text4" style="margin-left: 24px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">Mobile No:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text5" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">User Role:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text6" style="margin-left: 1px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3">Reporting To:</div>
                                                    <div class="col-md-4">
                                                        <input type="text" id="Text7" style="margin-left: -26px;" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-3"></div>
                                                    <div class="col-md-3" style="margin-left: 61px;">
                                                        <button id="Button1" class="btn btn-success pull-right" type="button">Save</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="dvEmailTemplate">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="input-group pull-right">
                                                        <input type="file" id="file" style="display: none; background-color: white;" onchange="setfilename(this.value);" class="form-control" />
                                                        <input class="form-control nrb input-sm" disabled="disabled" id="path" placeholder="No file selected" />
                                                        <div class="input-group-btn">
                                                            <button type="button" style="height: 30px; top: -3px;" class="btn btn-primary  btn-iconed btn-sm " onclick="document.getElementById('file').click();" id="my-awesome-dropzone"><span>Browse</span></button>
                                                            <a href="#" onclick="UploadMassDetails();" class="plupload_button plupload_start" id="btnEmp_massupload">Start upload</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>

                                                <div id="GridSalary">
                                                    <div class="head clearfix">
                                                        <div class="isw-settings"></div>
                                                        <h1>Users Details</h1>
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
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="dvWorkflow">
                                            <div class="row">
                                                Basic - Email Template - Design
                                                <div class="block-fluid" id="wysiwyg_container">

                                                    <textarea id="wysiwyg" name="text" style="height: 500px;"></textarea>

                                                </div>

                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 pull-right">
                                                    <button id="Button2" class="btn btn-success pull-right" type="button">Save</button>
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


</asp:Content>
