<%-- 
    Document   : SearchBooking
    Created on : Nov 28, 2016, 9:28:07 PM
    Author     : dung nguyen
--%>

<%@page import="com.entities.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dal.BookingContext"%>
<%@page import="com.dal.LoginContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <%
            LoginContext lc = new LoginContext();
            String mode = lc.getMode((String) session.getAttribute("logined")).trim();
        %>

        <t:login url="login.jsp" message="You have to login first"/>
        <form action="BookingController">
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
            <%
                if (request.getAttribute("update") != null) {
            %>
            <p style="color:green; font-size: 20ox"><%=request.getAttribute("update")%></p>
            <%}
            %>
            <div class="center">     
                <p style="font-size: 20px;float:  ">Enter Booking Number <input id="idBooking"type="text" value="" name="id"/> 
                    <input type="submit" value="search" name="btn"/>
                    <input type="submit" value="clear" name="btn"/>
            </div> 

            <div class="table">
                <table id ="dataTable" border="1" cellspacing="0" width="600">
                    <tr>
                        <th>Booking ID</th>
                        <th>Customer Name</th>
                        <th>Flight Number</th>
                        <th>Route</th>
                        <th>Booking Date</th>
                    </tr>

                    <% if (mode.equalsIgnoreCase("admin")) { %>
                    <c:forEach items="${lister}" var="i">
                        <tr>
                            <td><a href="BookingDetail.jsp?id=${i.id}" />${i.id}</td>
                            <td>${i.cus_name}</td>
                            <td>${i.flight_number}</td>
                            <td>${i.route}</td>
                            <td>${i.date}</td>

                            <td id="admode3" ><input  type="button" value="update" onclick="window.location = 'UpdateBooking.jsp?id=${i.id}'" name="btn"</td>
                            <td><input type="submit" value="delete" onclick="getData(this)" name="btn"</td>
                        </tr>
                    </c:forEach>
                    <%} else {
                        String user = (String) session.getAttribute("logined");
                        String currentUser = user.toUpperCase();
                        BookingContext bc = new BookingContext();

                        request.setAttribute("userList", bc.getBookingByName(currentUser));
                    %>
                    <c:forEach items="${userList}" var="i">
                        <tr>
                            <td><a href="BookingDetail.jsp?id=${i.id}" />${i.id}</td>
                            <td>${i.cus_name}</td>
                            <td>${i.flight_number}</td>
                            <td>${i.route}</td>
                            <td>${i.date}</td>


                            <td><input type="submit" value="delete" onclick="getData(this)" name="btn"</td>
                        </tr>
                    </c:forEach>
                    <%}%>


                </table>
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
    function getData(element) {
        if (confirm('Are you sure you want to delete this thing into the database?')) {
             document.getElementById("idBooking").value = document.getElementById("dataTable").rows[element.parentNode.parentNode.rowIndex].cells[0].textContent;
        } else {
            // Do nothing!
        }
       
    }
    function doConfirm() {
        alert(2);
    }


</script>


