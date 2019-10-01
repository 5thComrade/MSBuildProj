<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Config/Payroll_Config.master" AutoEventWireup="true" CodeBehind="Payroll_Components_Group_Mapping.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Config.Payroll_Salary_Components_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <script>
        $(document).ready(function () {
            Bind_ddlgroupelement();
            ddlSettings();
        });
        function ddlSettings() {
            $('#btnRight').click(function (e) {
                var selectedOpts = $('#lstBox1 option:selected');
                if (selectedOpts.length == 0) {
                    swal("", "Select group element.", "warning");
                    e.preventDefault();
                }

                $('#lstBox2').append($(selectedOpts).clone());
                $(selectedOpts).remove();
                e.preventDefault();
            });

            $('#btnAllRight').click(function (e) {
                var selectedOpts = $('#lstBox1 option');
                if (selectedOpts.length == 0) {
                    swal("", "No group elements.", "warning");
                    e.preventDefault();
                }

                $('#lstBox2').append($(selectedOpts).clone());
                $(selectedOpts).remove();
                e.preventDefault();
            });

            $('#btnLeft').click(function (e) {
                var selectedOpts = $('#lstBox2 option:selected');
                if (selectedOpts.length == 0) {
                    swal("", "Select group element.", "warning");
                    e.preventDefault();
                }

                $('#lstBox1').append($(selectedOpts).clone());
                $(selectedOpts).remove();
                e.preventDefault();
            });

            $('#btnAllLeft').click(function (e) {
                var selectedOpts = $('#lstBox2 option');
                if (selectedOpts.length == 0) {
                    swal("", "No group elements.", "warning");
                    e.preventDefault();
                }

                $('#lstBox1').append($(selectedOpts).clone());
                $(selectedOpts).remove();
                e.preventDefault();
            });
        }
        function Bind_ddlgroupelement() {

            $('[id$=ddlgroupelement]').empty();
            $('[id$=ddlgroupelement]').append('<option value="">Select</option>');
            $.ajax({
                type: "POST",
                url: "../WebServices/Payroll_Webservices.asmx/GetCommonLookupValues",
                data: "{Lookupvalue:'Groups'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "") {
                        for (var i = 0; i < data.d.length; i++) {
                            $('[id$=ddlgroupelement]').append('<option value="' + data.d[i].CLV_LOOKUP_ID + '">'
                                + data.d[i].CLV_VALUE + '</option>');
                        }
                        $('[id$=ddlgroupelement]').chosen();
                    }
                },
                failure: function (response) {
                    swal("", "Error while loading group elements.", "error");
                }
            });
        }

    </script>


    <div class="content inner-block">
        <div id="form" class="w2ui-reset w2ui-form container ">
            <div class="w2ui-form-header">
                <i class="fa fa-cogs"></i>&nbsp; Components Group Mapping
                <div class="header-icon">
                    <li><a href="#" data-placement="top" title="" data-original-title="Add" data-toggle="modal" data-target="#myModal" data-backdrop="static"><i class="fa fa-plus" title="Add" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-file-text-o" title="Export" aria-hidden="true"></i></a></li>
                </div>
            </div>

            <div class="w2ui-page page-0" style="display: block; top: 30px; bottom: 58px; height: 380px;">
                <div class="table-responsive">
                    <div id="grid" style="width: 100%; height: 350px;"></div>
                </div>
            </div>

        </div>
    </div>


    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog" style="width: 95%; left: 0px; margin-left: 61px; padding-top: 54px;">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" class="close">&times</button>
                    <h4 class="modal-title">Group Element</h4>
                </div>
                <div class="modal-body " style="height: 400px;">
                    <div class="w2ui-page page-0">
                        <table>
                            <tr>
                                <td>
                                    <div style="width: 340px; float: left; margin-right: 0px;">
                                        <div style="padding: 3px;">Group Element</div>
                                        <div class="w2ui-group" style="height: 280px; width: 1039px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div class="w2ui-field w2ui-span4">
                                                            <label>Select Group:</label>
                                                            <div>
                                                                <select id="ddlgroupelement" name="groupelement" maxlength="100" style="width: 100%">
                                                                    <option></option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <div class="w2ui-field w2ui-span4">
                                                            <label>Select Group:</label>
                                                            <div>
                                                                <select multiple="multiple" id='lstBox1' maxlength="100" style="width: 100%; height: 150px;" class="multi-choose">
                                                                    <option value="ajax">Ajax</option>
                                                                    <option value="jquery">jQuery</option>
                                                                    <option value="javascript">JavaScript</option>
                                                                    <option value="mootool">MooTools</option>
                                                                    <option value="prototype">Prototype</option>
                                                                    <option value="dojo">Dojo</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="w2ui-field w2ui-span1">
                                                            <div class="subject-info-arrows">
                                                                <input type='button' id='btnAllRight' value=">>" class="choose-btn-sm choose-btn " style="height: 25px; width: 25px;" /><br />
                                                                <input type='button' id='btnRight' value='>' class="choose-btn-sm choose-btn" style="height: 25px; width: 25px;" /><br />
                                                                <input type='button' id='btnLeft' value='<' class="choose-btn-sm choose-btn" style="height: 25px; width: 25px;" /><br />
                                                                <input type='button' id='btnAllLeft' value='<<' class="choose-btn-sm choose-btn" style="height: 25px; width: 25px;" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="w2ui-field w2ui-span4">
                                                            <div style="margin-left: 20px;">
                                                                <select multiple="multiple" id='lstBox2' maxlength="100" style="width: 220px; height: 150px;" class="multi-choose">
                                                                    <option value="asp">ASP.NET</option>
                                                                    <option value="c#">C#</option>
                                                                    <option value="vb">VB.NET</option>
                                                                    <option value="java">Java</option>
                                                                    <option value="php">PHP</option>
                                                                    <option value="python">Python</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
