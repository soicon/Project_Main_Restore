<%-- 
    Document   : ChangePassword
    Created on : Nov 28, 2016, 9:33:02 PM
    Author     : dung nguyen
--%>


<%@page import="com.dal.LoginContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="screen">
                <style >

            body {
                background: white }
            section {
                background: black;
                color: white;
                border-radius: 1em;
                padding: 1em;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-right: -50%;
                transform: translate(-50%, -50%) }

            /* Keep the translations off to the side */
            #translations {position: absolute; top: 0; right: 0; padding: 0.5em;
                           font-size: small; background: hsla(0,0%,100%,0.9); margin: 0 1em}
            #translations * {font-size: 100%; margin: 0}
            #translations ul {padding-left: 1em}

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
        <form action="BookingController">
            <section>          
                <%
                    if (request.getAttribute("error") != null) {
                %>
                <p style="color:red;"><%=request.getAttribute("error")%></p>
                <%} else if (request.getAttribute("change") != null) {
                %>
                <p style="color:green;"><%=request.getAttribute("change")%></p>
                <%}%>
                <p>ID<span style="padding-left:57px"></span><input readonly type="text" value="<%=session.getAttribute("logined")%>" name="uid" /></p><br>
                <p>Password : <input type="password" value="" name="pwd"/></p><br>               
                <span style="padding-left: 80px"></span>
                <input style="" type="submit" value="Change" name="btn"/>
                <span style="padding-left: 20px"></span>
                <input style="" type="button" value="Back" onclick="window.location = 'index.jsp'" name="btn"/>


            </section>
        </form>
        <script>
                if ("<%=mode%>" === "user") {

                    document.getElementById("admode").style.display = "none";
                    document.getElementById("admode1").style.display = "none";
                    document.getElementById("admode2").style.display = "none";

                }

        </script>
    </body>
</html>
