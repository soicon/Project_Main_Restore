<%-- 
    Document   : CustomerDetail
    Created on : Nov 28, 2016, 9:31:25 PM
    Author     : dung nguyen
--%>
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
        <%
            LoginContext lc = new LoginContext();
            String mode = lc.getMode((String) session.getAttribute("logined")).trim();
        %>

        <jsp:useBean id="customerDetail" scope="session" class="com.dal.LoginContext"/>
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
            <div class="center">         
                <% String ids = request.getParameter("uid");  %>
                <%pageContext.setAttribute("cus", customerDetail.getInfoByName(ids));%>
                <c:forEach items="${cus}" var="i">
                    <p style="font-size: 20px">ID: ${i.id}</p> <br><br>
                    <p style="font-size: 20px">Customer Name : ${i.uid}</p>  <br><br>   
                    <p style="font-size: 20px">Role: ${i.mode}</p> <br><br>                    
                    <p style="font-size: 20px">Date: ${i.date}</p> <br><br>
                    <input  type="button" value="back" onclick="window.location = 'SearchCustomer.jsp'" name="btn"/>

                </c:forEach>
            </div>
            <script>
                if ("<%=mode%>" === "user") {

                    document.getElementById("admode").style.display = "none";
                    document.getElementById("admode1").style.display = "none";
                    document.getElementById("admode2").style.display = "none";

                }

            </script>
    </body>
</html>
