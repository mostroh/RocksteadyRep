<%-- 
    Document   : mainblog
    Created on : 13-dic-2014, 12:51:57
    Author     : Blackproxy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rocksteady Festivals Blog</title>
    </head>
    <body>
        <h1>Rocksteady!</h1>
        <c:forEach items="${postList}" var="mensaje">
        ${mensaje.getTitle()}
    </c:forEach>
    </body>
</html>
