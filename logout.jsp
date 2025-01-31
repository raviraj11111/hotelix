<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    session.invalidate(); // Invalidate session
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
