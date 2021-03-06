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
        <form action="CustomerController">
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
                   <% if (mode.equalsIgnoreCase("admin")) { %>
                <p style="font-size: 20px;float:  ">Enter Customer Name <input id="idCustomer"type="text" value="" name="cus_name"/> 
                    <input type="submit" value="search" name="btn"/>
                    <%}%>
                    
            </div> 

            <div class="table">
                <table id ="dataTable" border="1" cellspacing="0" width="600">
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>                        
                        <th>Create Date</th>
                        <th>Role</th>
                        
                    </tr>

                    <% if (mode.equalsIgnoreCase("admin")) { %>
                    <c:forEach items="${listCustomer}" var="i">
                        <tr>
                            <td><a href="CustomerDetail.jsp?uid=${i.uid}" />${i.id}</td>
                            
                            <td>${i.uid}</td>                            
                            <td>${i.date}</td>
                            <td>${i.mode}</td>

                            <td><a href="ChangePassword.jsp"/>Change Password</td>
                            <td><a href="BookingController?id=${i.uid}&btn=search"/>View All Booking</td>
                        </tr>
                    </c:forEach>
                    <%} else {
                        String user = (String) session.getAttribute("logined");
                        
                        

                        request.setAttribute("user", lc.getInfoByName(user));
                    %>
                    <c:forEach items="${user}" var="j">
                        <tr>
                            <td><a href="CustomerDetail.jsp?uid=${j.uid}" />${j.id}</td>
                            <td>${j.uid}</td>                            
                            <td>${j.date}</td>
                            <td>${j.mode}</td>


                             <td><a href="ChangePassword.jsp"/>Change Password</td>
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

        document.getElementById("idBooking").value = document.getElementById("dataTable").rows[element.parentNode.parentNode.rowIndex].cells[0].textContent;
    }


</script>

