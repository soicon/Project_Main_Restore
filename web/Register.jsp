<%-- 
    Document   : Register
    Created on : Dec 1, 2016, 6:03:09 PM
    Author     : dung nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>Registration Form</title>
    <link rel="stylesheet" href="css/register.css">

</head>
<body>


    <h1 class="register-title">Welcome</h1>
    <form action="ValidLogin.jsp" class="register">
        <%
            if (session.getAttribute("errorRegister") != null) {
               
        %>
        <p style="color:red;"><%=session.getAttribute("errorRegister")%></p>
        <%  session.invalidate(); } else if (session.getAttribute("registerUser") != null) {
        %>
        <p style="color:green;"><%=session.getAttribute("registerUser")%></p>
        <% session.invalidate();}%>
        <div class="register-switch">
            <input type="radio" name="sex" value="F" id="sex_f" class="register-switch-input" checked>
            <label for="sex_f" class="register-switch-label">Female</label>
            <input type="radio" name="sex" value="M" id="sex_m" class="register-switch-input">
            <label for="sex_m" class="register-switch-label">Male</label>
        </div>
        <input type="text" class="register-input" placeholder="Email address" name="uid">
        <input type="password" class="register-input" placeholder="Password" name="pwd">
        <input type="submit" value="Register" class="register-button" name="btn">
        <input type="button" value="Back" onclick="window.location = 'index.jsp'" class="register-button" name="btn">
    </form>
</body>
</html>
