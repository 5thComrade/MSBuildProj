<%@ Page Title="" Language="C#" MasterPageFile="~/GUI/Dashboard/Payroll_Home_DashBoard.master" AutoEventWireup="true" CodeBehind="Payroll_Home.aspx.cs" Inherits="Payroll_Outsourcing.GUI.Dashboard.Payroll_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ChildContent" runat="server">
    <link rel='stylesheet' type='text/css' href="../../css/DateTimePicker.css" />
    <script type='text/javascript' src="../../js/DateTimePicker.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#dtBox").DateTimePicker({
                isInline: true,
                inputElement: $("#input-date"),
                buttonsToDisplay: [],
                showHeader: false,
                readonlyInputs: false,
                setValueInTextboxOnEveryClick: true,
                settingValueOfElement: function (oDTP, sElemValue, dElemValue, $oElem) {
                    console.log("settingValueOfElement : " + sElemValue);
                    console.log(dElemValue);
                }              

            });
            //$('#ddlProject').select2();
            $('#ddlTask').select2();



            var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
            var dayNames = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

            var newDate = new Date();
            newDate.setDate(newDate.getDate());

            setInterval(function () {
                var hours = new Date().getHours();
                if (hours >= 12) {
                    hours = hours - 12;
                }
                $(".hour").html((hours < 10 ? "0" : "") + hours);
                var seconds = new Date().getSeconds();
                $(".second").html((seconds < 10 ? "0" : "") + seconds);
                var minutes = new Date().getMinutes();
                $(".minute").html((minutes < 10 ? "0" : "") + minutes);

                $(".month1 span,.month2 span").text(monthNames[newDate.getMonth()]);
                $(".date1 span,.date2 span").text(newDate.getDate());
                $(".day1 span,.day2 span").text(dayNames[newDate.getDay()]);
                $(".year1 span").html(newDate.getFullYear());
            }, 1000);



            $(".outer").on({
                mousedown: function () {
                    $(".dribbble").css("opacity", "1");
                },
                mouseup: function () {
                    $(".dribbble").css("opacity", "0");
                }
            });



        });
	</script>
    <style type="text/css">
        /* -- usable codes start -- */


        .ulliData {
            margin: 0;
            padding: 0;
            border: 0;
            font-weight: inherit;
            font-style: inherit;
            font-size: 100%;
            font-family: inherit;
            vertical-align: baseline;
            text-decoration: none;
            list-style: none;
        }

        img {
            width: 100%;
        }

        .anim04c {
            -webkit-transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
            transition: all .4s cubic-bezier(.5, .35, .15, 1.4);
        }

        .outer {
            position: relative;
            top: 50%;
            z-index: 1;
            -webkit-transform: translateY(-50%);
            -moz-transform: translateY(-50%);
            -ms-transform: translateY(-50%);
            -o-transform: translateY(-50%);
            transform: translateY(-50%);
            cursor: pointer;
        }
        /*-----*/

        .signboard {
            width: 100px;
            height: 100px;
            margin: auto;
            color: #fff;
            border-radius: 10px;
        }
        /*-----*/

        .front {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 3;
            background: #ff726b;
            text-align: center;
        }

        .right {
            position: absolute;
            right: : 0;
            z-index: 2;
            -webkit-transform: rotate(-10deg) translate(7px, 8px);
            -moz-transform: rotate(-10deg) translate(7px, 8px);
            -ms-transform: rotate(-10deg) translate(7px, 8px);
            -o-transform: rotate(-10deg) translate(7px, 8px);
            transform: rotate(-10deg) translate(7px, 8px);
            background: #EFC94C;
        }

        .left {
            position: absolute;
            left: 0;
            z-index: 1;
            -webkit-transform: rotate(5deg) translate(-4px, 4px);
            -moz-transform: rotate(5deg) translate(-4px, 4px);
            -ms-transform: rotate(5deg) translate(-4px, 4px);
            -o-transform: rotate(5deg) translate(-4px, 4px);
            transform: rotate(5deg) translate(-4px, 4px);
            background: #3498DB;
        }
        /*-----*/

        .outer:hover .inner {
            -webkit-transform: rotate(0) translate(0);
            -moz-transform: rotate(0) translate(0);
            -ms-transform: rotate(0) translate(0);
            -o-transform: rotate(0) translate(0);
            transform: rotate(0) translate(0);
        }
        /*-----*/

        .outer:active .inner {
            -webkit-transform: rotate(0) translate(0) scale(0.9);
            -moz-transform: rotate(0) translate(0) scale(0.9);
            -ms-transform: rotate(0) translate(0) scale(0.9);
            -o-transform: rotate(0) translate(0) scale(0.9);
            transform: rotate(0) translate(0) scale(0.9);
        }

        .outer:active .front .date {
            -webkit-transform: scale(2);
        }

        .outer:active .front .day,
        .outer:active .front .month {
            visibility: hidden;
            opacity: 0;
            -webkit-transform: scale(0);
            -moz-transform: scale(0);
            -ms-transform: scale(0);
            -o-transform: scale(0);
            transform: scale(0);
        }

        .outer:active .right {
            -webkit-transform: rotate(-5deg) translateX(80px) scale(0.9);
            -moz-transform: rotate(-5deg) translateX(80px) scale(0.9);
            -ms-transform: rotate(-5deg) translateX(80px) scale(0.9);
            -o-transform: rotate(-5deg) translateX(80px) scale(0.9);
            transform: rotate(-5deg) translateX(80px) scale(0.9);
        }

        .outer:active .left {
            -webkit-transform: rotate(5deg) translateX(-80px) scale(0.9);
            -moz-transform: rotate(5deg) translateX(-80px) scale(0.9);
            -ms-transform: rotate(5deg) translateX(-80px) scale(0.9);
            -o-transform: rotate(5deg) translateX(-80px) scale(0.9);
            transform: rotate(5deg) translateX(-80px) scale(0.9);
        }
        /*-----*/

        .outer:active .calendarMain {
            -webkit-transform: scale(1.8);
            opacity: 0;
            visibility: hidden;
        }

        .outer:active .clock {
            -webkit-transform: scale(1.4);
            opacity: 1;
            visibility: visible;
        }

        .outer:active .calendarNormal {
            bottom: -30px;
            opacity: 1;
            visibility: visible;
        }

        .outer:active .year1 {
            top: -30px;
            opacity: 1;
            visibility: visible;
            letter-spacing: 3px;
        }
        /*-----*/

        .calendarMain {
            width: 100%;
            height: 100%;
            position: absolute;
            opacity: 1;
        }

        .month1,
        .day1 {
            font-size: 10px;
            line-height: 30px;
            text-transform: uppercase;
        }

        .date1 {
            font-size: 40px;
            line-height: 40px;
            text-transform: uppercase;
        }
        /*-----*/

        .clock {
            width: 100%;
            height: 100%;
            position: absolute;
            font-size: 12px;
            line-height: 100px;
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-align: center;
            opacity: 0;
            visibility: hidden;
        }
        /*-----*/

        .year1 {
            width: 100%;
            position: absolute;
            top: 0;
            font-size: 11px;
            line-height: 30px;
            font-weight: 300;
            text-transform: uppercase;
            letter-spacing: 0;
            text-align: center;
            opacity: 0;
            visibility: hidden;
            color: #ff726b;
        }

        .calendarNormal {
            width: 100%;
            position: absolute;
            bottom: 0;
            font-size: 11px;
            line-height: 30px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-align: center;
            opacity: 0;
            visibility: hidden;
        }

        .date2 {
            color: #ff726b;
        }

        .day2 {
            color: #3498DB;
        }

        .month2 {
            color: #EFC94C;
        }
        /* -- usable codes end -- */
    </style>
    <div class="workplace">
        <div class="row" style="margin-top: -43px;">


            <div class="col-md-4">

                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #c9ace6;">

                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 320px;">
                        <div class="mCustomScrollBox mCS-light" id="mCSB_1" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Timesheet</a>
                                    <%--<br />
                                                         <span id="input-date" type="text" data-field="date"></span>
                                    <br />--%>
                                    <div id="dtBox" style="height: 200px; color: black;"></div>


                                    <div style="margin-top: -148px;">

                                        <span><b>Project</b></span>
                                        <br />
                                        <select name="saluation" id="ddlProject" style="width: 65%;">
                                        </select>

                                        <button class="btn btn-default" type="button" style="background-color: #a783cc; float: right; width: 98px; height: 96px; font-size: 18px; color: #fff;">
                                            0.00<br />
                                            Hours
                                        </button>

                                    </div>
                                    <span><b>Task</b></span><br />
                                    <select name="saluation" id="ddlTask" style="width: 65%;">
                                    </select>
                                    <br />
                                    <span><b>Hours</b></span><br />
                                    <input type="text" style="width: 35%;" /><br />

                                    <span><b>Comments</b></span><br />
                                    <input type="text" style="width: 65%; height: 60px;" />


                                </div>



                            </div>

                        </div>
                    </div>

                </div>
            </div>


            <div class="col-md-4">

                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">

                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 320px;">
                        <div class="mCustomScrollBox mCS-light" id="Div1" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Leaves</a>
                                    <br />
                                    <br />
                                    <div class="btn-group">
                                        <button class="btn btn-danger dropdown-toggle" style="width: 107%"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;Call Sick</button>
                                    </div>
                                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td><span class="time">Used</span><span class="time">0</span></td>
                                                <td><span class="time">Available</span><span class="time">15</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    <br />
                                    <div class="btn-group">
                                        <button class="btn btn-info dropdown-toggle" style="width: 93%"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;&nbsp;Paid/Unpaid</button>
                                    </div>
                                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td><span class="time">Used</span><span class="time">0</span></td>
                                                <td><span class="time">Available</span><span class="time">15</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>

            </div>



            <div class="col-md-4">
                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">

                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 320px;">
                        <div class="mCustomScrollBox mCS-light" id="Div2" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Quick poll</a>
                                    <br />
                                    <br />
                                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td><span class="date" style="text-align: justify;">Should we have a fun session for an hour every friday</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="checkbox checkbox-inline">
                                                        <input type="radio" name="radio1">Yes</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label class="checkbox checkbox-inline">
                                                        <input type="radio" name="radio1">No</label></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <br />
                                                    <button class="btn btn-primary" type="button">Submit</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>



                            </div>

                        </div>
                    </div>

                </div>
            </div>


            <div class="col-md-4">
                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">

                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 320px;">
                        <div class="mCustomScrollBox mCS-light" id="Div4" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Attendance</a>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <!-- main codes start -->
                                    <div class="signboard outer">
                                        <div class="signboard front inner anim04c">
                                            <li class="ulliData year1 anim04c">
                                                <span></span>
                                            </li>
                                            <ul class="ulliData calendarMain anim04c">
                                                <li class="month1 anim04c">
                                                    <span></span>
                                                </li>
                                                <li class="ulliData date1 anim04c">
                                                    <span></span>
                                                </li>
                                                <li class="ulliData day1 anim04c">
                                                    <span></span>
                                                </li>
                                            </ul>
                                            <li class="ulliData clock minute anim04c">
                                                <span></span>
                                            </li>
                                            <li class="ulliData calendarNormal date2 anim04c">
                                                <span></span>
                                            </li>
                                        </div>
                                        <div class="signboard left inner anim04c">
                                            <li class="ulliData clock hour anim04c">
                                                <span></span>
                                            </li>
                                            <li class="ulliData calendarNormal day2 anim04c">
                                                <span></span>
                                            </li>
                                        </div>
                                        <div class="signboard right inner anim04c">
                                            <li class="ulliData clock second anim04c">
                                                <span></span>
                                            </li>
                                            <li class="ulliData calendarNormal month2 anim04c">
                                                <span></span>
                                            </li>
                                        </div>
                                    </div>
                                    <!-- main codes end -->

                                    <div class="btn-group" style="float: right; margin-top: -33px;">
                                        <button class="btn btn-info dropdown-toggle"><span class="glyphicon glyphicon-plus-sign"></span>&nbsp;&nbsp;&nbsp;Web-Clock-In</button>
                                    </div>

                                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><span class="date" style="text-align: justify;">Last Week Stats</span></td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <div class="btn-group">
                                                        <button class="btn btn-warning dropdown-toggle">&nbsp;&nbsp;0&nbsp;Avg-Hours/day</button>
                                                    </div>
                                                </td>
                                                <td>

                                                    <div class="btn-group">
                                                        <button class="btn btn-info dropdown-toggle">&nbsp;&nbsp;&nbsp;Remote Clock-In</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>

                                                    <div class="btn-group">

                                                        <button class="btn btn-warning dropdown-toggle">&nbsp;&nbsp;0%&nbsp;On-Time Arr...</button>
                                                    </div>
                                                </td>
                                                <td>

                                                    <div class="btn-group">
                                                        <button class="btn btn-info dropdown-toggle">&nbsp;&nbsp;&nbsp;Work From Home</button>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>



                            </div>

                        </div>
                    </div>

                </div>
            </div>


            <div class="col-md-4">
                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">

                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 320px;">
                        <div class="mCustomScrollBox mCS-light" id="Div3" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;">
                                <div class="item">
                                    <a href="#" style="color: #000;">Leave Approvals</a>
                                    <br />
                                    <br />
                                </div>



                            </div>

                        </div>
                    </div>

                </div>
            </div>


            <div class="col-md-4">

                <div class="block news scrollBox" style="border-top: 4px solid #365b85; background-color: #fff;">
                    <%--<img src="../../img/Ballon1.png" style="height: 89px; width: 63px; margin-top: -10px; margin-left: -6px;" />--%>
                    <%--<a href="#" style="color: #000; text-align: center; font-size: 12px; font-weight: bold;margin-left:46px;">Upcoming Birthday</a>--%>
                    <%--<img src="../../img/Ballon1.png" style="height: 89px; width: 63px; float: right; margin-top: -9px; /* margin-left: 255px; */" />--%>
                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td style="border: 0px;"><img src="../../img/balloons.png" style="height: 89px; width: 63px; margin-top: -10px; margin-left: -6px;border:0px;" />                                              
                                                </td>
                                                 <td style="border: 0px;"><img src="../../img/balloons.png" style="height: 89px; width: 63px; margin-top: -10px; margin-left: -6px;border:0px;" />                                              
                                                </td>
                                                 <td style="border: 0px;"><img src="../../img/balloons.png" style="height: 89px; width: 63px; margin-top: -10px; margin-left: -6px;border:0px;" />                                              
                                                </td>
                                                 <td style="border: 0px;"><img src="../../img/balloons.png" style="height: 89px; width: 63px; margin-top: -10px; margin-left: -6px;border:0px;" />                                              
                                                </td>

                                            </tr>   
                                            <tr >
                                                <td colspan="4" style="border: 0px;text-align:center;font-weight:bold;">
                                                    <a href="#" style="text-decoration:none;color:#000" class="date">Upcoming -Birthdays</a>
                                                </td>
                                            </tr>                            
                                        </tbody>
                                    </table>
                    <div class="scroll mCustomScrollbar _mCS_1" style="height: 198px;">
                        <div class="mCustomScrollBox mCS-light" id="Div5" style="position: relative; height: 100%; overflow: hidden; max-width: 100%;">
                            <div class="mCSB_container" style="position: relative; top: 0px;width:100%">
                                <div class="item">
                                    <table cellpadding="0" cellspacing="0" width="100%" class="sOrders">
                                        <tbody>
                                            <tr>
                                                <td>Chandramouli GM                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Prakash                                                  
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hari                                                 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Balaji                                             
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Hirthik                                                 
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Rajesh                                                 
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>



                            </div>

                        </div>
                    </div>

                </div>
            </div>



        </div>
    </div>
</asp:Content>
