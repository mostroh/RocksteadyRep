<%-- 
    Document   : Welcom
    Created on : 10-dic-2014, 0:26:48
    Author     : YSF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido</title>
    </head>
    <body>
        
        <h1>Gracias por logearte nombre <c:out value="${Datos.nombre}"></c:out></h1>
        <p> password <c:out value = "${Datos.password}"></c:out></p>
        <p> edad <c:out value = "${Datos.edad}"></c:out></p>
    </body>
</html>
