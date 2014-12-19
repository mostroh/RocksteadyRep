<%-- 
    Document   : SingUp
    Created on : 17-dic-2014, 14:16:39
    Author     : inftel12
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<c:if test="${not empty sessionScope.locale}">
<fmt:setLocale value="${sessionScope.locale}" scope= "session"/>
</c:if>
<fmt:setBundle basename="Internalizacion.messages" />
<html>
    <head>
        <title>Home - Rocksteady Blog</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-panels.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        </noscript>
    </head>
    <body>
        
        <!-- Header -->
        <div id="header">
            <div class="container">

                <!-- Logo -->
                <div id="logo">
                    <h1><a>Rocksteady</a></h1>
                    <span>BLOG</span>
                </div>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="IndexServlet"><fmt:message key="home"/></a></li>
                        <li><a href="PostServlet">Blog</a></li>
                        <c:if test="${empty usuario}">
                            <li>
                                <a href="signUp.jsp"><fmt:message key="signup"/></a>
                            </li>
                        </c:if>
                        <c:if test="${not empty usuario}">
                            <c:if test="${usuario.userType == 1}">
                            <li>
                                <a href="admin.jsp"><fmt:message key="adminArea"/></a>
                            </c:if>
                            <li>
                                <a href="editProfile.jsp"><fmt:message key="editProfile"/></a>
                            </li>
                            <li>
                                <a href="LogOutServlet"><fmt:message key="logout"/></a>
                            </li>
                        </c:if>
                        
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Header -->
        <div id="main">
            <div class="container">
                <div align="center">
                        <form action="SingUpServlet" method="post" enctype="multipart/form-data">
                            <div class="4u" align="right">
                                <fmt:message key="userName"/>: <input type="text" name="username" value="" required="true"><br>
                                <fmt:message key="nombre"/>: <input type="text" name="nombre" value="" required="true"/><br>
                                <fmt:message key="lastName"/>: <input type="text" name="apellido" value="" required="true"/><br>
                                Email: <input type="email" name="email" value="" required="true" /><br>
                                <fmt:message key="password"/>:<input type="password" name="password" pattern=".{6,}" required title="6 characters minimum"/><br>
                                <fmt:message key="confirmPassword"/>:<input type="password" name="confirmPassword" pattern=".{6,}" required title="6 characters minimum"/><br>
                                Website: <input type="text" name="website" value="" /><br>
                                <fmt:message key="Description"/>:<input type="text" name="descriptionSingUp" value="" /><br>
                                Twitter: <input type="text" name="twitterSingUp" value="" /><br>
                                Facebook: <input type="text" name="facebookSingUp" value="" /><br>
                                Instagram: <input type="text" name="instagramSingUp" value="" /><br>
                                Linkedin: <input type="text" name="linkedinSingUp" value="" /><br><br>
                                <fmt:message key="selectimage"/>:  <input type="file" name="image" accept="image/*"><br> 
                            </div>    
                            <center><input type="submit" value="<fmt:message key="signup"/>"></center>
                        </form>
                    <c:if test="${not empty errorMessage}">
                        <font color="red">${errorMessage}</font>
                    </c:if>
                </div>
            </div>
        </div>
        <div id="copyright">
            <div class="container">
            </div>
        </div>
    </body>
</html>