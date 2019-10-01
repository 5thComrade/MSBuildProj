<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Employee/Payroll_Employee.master" AutoEventWireup="true" CodeBehind="Payroll_Employee_Dashboard.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Employee.Payroll_Employee_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
        });
    </script>

    <div class="workplace">
        <div class="row">
            <div class="col-md-12">
                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                    <div class="" style="height: auto;">
                        <div class="mCustomScrollBox mCS-light" id="Div1" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <h4 style="margin-top: 35px;">Employee Logins</h4>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="wBlock blue auto clearfix">
                                                <div class="dSpace">
                                                    <h3>All Employee</h3>
                                                    <span class="number">333</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="wBlock blue auto clearfix">
                                                <div class="dSpace">
                                                    <h3>Invited</h3>
                                                    <span class="number">333</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="wBlock blue auto clearfix">
                                                <div class="dSpace">
                                                    <h3>Registered</h3>
                                                    <span class="number">11</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="wBlock blue auto clearfix">
                                                <div class="dSpace">
                                                    <h3>Pending Registration</h3>
                                                    <span class="number">33</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="wBlock blue auto clearfix">
                                                <div class="dSpace">
                                                    <h3>Not Invited</h3>
                                                    <span class="number">333</span>
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
            <div class="col-md-4">
                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                    <div class="" style="height: auto;">
                        <div class="mCustomScrollBox mCS-light" id="Div2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Quick Link</a>
                                    <div class="row">
                                        <div class="col-md-1"><i class="glyphicon glyphicon-user" style="color: #7E8FC4;"></i></div>
                                        <div class="col-md-6"><a href="#" style="color: #7E8FC4;">Add Employee</a></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1"><i class="glyphicon glyphicon-file" style="color: #7E8FC4;"></i></div>
                                        <div class="col-md-6"><a href="#" style="color: #7E8FC4;">Create Letter</a></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1"><i class=" glyphicon glyphicon-remove-circle" style="color: #7E8FC4;"></i></div>
                                        <div class="col-md-6"><a href="#" style="color: #7E8FC4;">Terminate Employee</a></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-1"><i class="glyphicon glyphicon-th" style="color: #7E8FC4;"></i></div>
                                        <div class="col-md-6"><a href="#" style="color: #7E8FC4;">All Employee</a></div>
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
