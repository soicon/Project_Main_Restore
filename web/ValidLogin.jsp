<%-- 
    Document   : ValidLogin
    Created on : Nov 28, 2016, 4:50:32 PM
    Author     : dung nguyen
--%>

<%@page import="com.dal.LoginContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("uid");
    String pass = request.getParameter("pwd");
    String action = request.getParameter("btn");
    LoginContext lc = new LoginContext();
    if (action.equalsIgnoreCase("register")) {
        lc.register(id, pass, "user");

        session.setAttribute("register", "Register Successfully");


        response.sendRedirect("login.jsp");

    } else {

        String uid = lc.getUID(id);
        if (uid.equalsIgnoreCase("")) {
            session.setAttribute("error", "This id doesn't exist.");
            response.sendRedirect("login.jsp");
        } else {
            String pwd = lc.getPass(id);
            if (pass.equalsIgnoreCase(pwd)) {
                session.setAttribute("logined", id);
                response.sendRedirect("index.jsp");
            } else {
                session.setAttribute("error", "Username or password is invalid");
                response.sendRedirect("login.jsp");
            }
        }
    }

%>
