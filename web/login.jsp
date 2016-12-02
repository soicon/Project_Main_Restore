<%-- 
    Document   : index
    Created on : Nov 28, 2016, 5:27:08 PM
    Author     : dung nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <section>

            <%
                if (session.getAttribute("error") != null) {
            %>
            <p style="color:red;"><%=session.getAttribute("error")%></p>
            <%}else if(session.getAttribute("register") != null){
            %>
             <p style="color:blue;"><%=session.getAttribute("register")%></p>
            <%}%>
            <form action="ValidLogin.jsp" >

                <p>ID<span style="padding-left:57px"></span><input  type="text" value="" name="uid"/></p>
                <p>Password : <input type="password" value="" name="pwd"/></p>
                
                
                
                <span style="padding-left: 110px"></span>
                <input style="" type="submit" value="login" name="btn"/>
                
                <p>Don't have a account? Click <a href="Register.jsp"/>here</a>
            </form>
        </section>

    </body>
</html>
