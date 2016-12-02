<%-- 
    Document   : logout
    Created on : Nov 28, 2016, 8:04:30 PM
    Author     : dung nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            if(request.getParameter("logout").equalsIgnoreCase("true")){
                session.invalidate();
                response.sendRedirect("login.jsp");
            }
        %>

        <h1>Hello World!</h1>

    </body>
</html>
