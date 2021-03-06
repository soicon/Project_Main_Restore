<%-- 
    Document   : UpdateBooking
    Created on : Nov 28, 2016, 9:31:42 PM
    Author     : dung nguyen
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.dal.RouteContext"%>
<%@page import="com.dal.LoginContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="detail" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="t" uri="/WEB-INF/tlds/tag" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="screen">
        <style>
            .center {

                left: 500px;
                top: 300px;
                position: absolute;
            }
            .table{

                left: 400px;
                top: 400px;
                position: absolute;
            }
        </style>
    </head>
    <body>
        <jsp:useBean id="detailer" scope="session" class="com.dal.BookingContext"/>
        <%
            LoginContext lc = new LoginContext();
            String mode = lc.getMode((String) session.getAttribute("logined")).trim();
        %>

        <t:login url="login.jsp" message="You have to login first"/>

        <div class="container">
            <div class="content">
                <div   style="float: right"><a href="logout.jsp?logout=true"/> <%=session.getAttribute("logined")%>,Log out </div>
                <ul id="nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#" >Booking</a>
                        <ul class="subs" >

                            <li><a href="SearchBooking.jsp">Search Booking</a></li>
                            <li><a href="AddBooking.jsp">Add New Booking</a></li>
                            <li><a href="BookingDetail.jsp">View Booking Details</a></li>
                            <li id="admode"><a href="UpdateBooking.jsp">Update Booking</a></li>

                        </ul>
                    </li>
                    <li><a href="#">Customer</a>
                        <ul class="subs">
                            <li id="admode1"><a href="AddCustomer.jsp">Add New Customer</a></li>
                            <li><a href="UpdateCustomer.jsp">Update Customer Info</a></li>
                            <li><a href="ChangePassword.jsp">Change Password</a></li>
                            <li id="admode2"><a href="ViewBookingByName.jsp">View Booking by Customer </a></li>
                        </ul>
                    </li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Author</a></li>
                </ul>
            </div>
        </div>

        <form action="BookingController">
            <div class="center">


                <%
                    if (request.getAttribute("update") != null) {

                        response.sendRedirect("SearchBooking.jsp");
                    } else if (request.getAttribute("delete") != null) {
                        response.sendRedirect("SearchBooking.jsp");
                    }
                %>
                <% String ids = "";
                    if (request.getParameter("id") != null) {
                        ids = request.getParameter("id");
                    } else {
                        ids = (String) session.getAttribute("logined");
                    }
                %>
                <%pageContext.setAttribute("d", detailer.getBookingById(ids));%>
                <c:forEach items="${d}" var="i">

                    <p style="font-size: 20px">Booking ID: <input readonly id="id" type="text" value="${i.id}" name="id"/></p> <br><br>
                    <p style="font-size: 20px">Customer Name : ${i.cus_name}</p>  <br><br>   
                    <%  if (request.getParameter("code") != null) {%>
                    <c:set var="x" value='<%=request.getParameter("code")%>'></c:set>
                    <%}%>

                    <p style="font-size: 20px">Flight Number: 
                        <select id="codeRoute" name="codeRoute" onchange="getCode()">
                            <option value=""></option>
                            <%
                                RouteContext rc = new RouteContext();
                                ArrayList<String> p = new ArrayList<>();
                                p = rc.getCode();
                                request.setAttribute("list", p);
                            %>
                            <c:forEach items="${list}" var="j">
                                <option value="${j}" ${j == x?'selected="selected"':''} >${j}</option>
                            </c:forEach>

                        </select>
                    <p style="font-size: 20px">Route: 
                        <%
                            String route = "";
                            if (request.getParameter("code") != null) {
                                route = rc.getRoute(request.getParameter("code"));
                            }

                        %>
                        <input id="route" readonly type="text" name="route" value="<%=route%>" /></p>    <br><br>
                    <p style="font-size: 20px">Date: ${i.date}</p> <br><br>
                    <p style="font-size: 20px">Booking Open: 


                        <input type="radio" name="isopen" checked /> Yes
                        <input type="radio" name="isopen" /> No

                        <%
                            double fare = -1;
                            if (request.getParameter("code") != null) {
                                fare = rc.getFare(request.getParameter("code"));
                            }
                        %>

                    <p style="font-size: 20px">Fare:  <input readonly type="text" name="fare" value="<%=fare%>" /></p> <br><br>
                    <p style="font-size: 20px">Departure: <input type="text" value="${i.departure}" name="depart"/></p> <br><br>
                    <p style="font-size: 20px">Arrival: <input type="text" value="${i.arrival}" name="arrival"/></p> <br><br>
                    <input  type="submit" value="save" name="btn"  />

                </c:forEach>
            </div>
            <script>
                if ("<%=mode%>" === "user") {

                    document.getElementById("admode").style.display = "none";
                    document.getElementById("admode1").style.display = "none";
                    document.getElementById("admode2").style.display = "none";

                }

            </script>

        </form>

    </body>
</html>
<script>
    function getCode() {
        var e = document.getElementById("codeRoute");
        var id = document.getElementById("id").value;
        var strUser = e.options[e.selectedIndex].value;
        window.location.replace("UpdateBooking.jsp?id="+id+"&code=" + strUser);
        document.getElementById('codeRoute').value = strUser;
    }

</script>
