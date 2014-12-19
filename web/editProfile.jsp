<%-- 
    Document   : editPerfil
    Created on : 17 déc. 2014, 23:47:29
    Author     : YSF
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
        <div id="header">
            <div class="container">
                <div id="logo">
                    <h1><a>Rocksteady</a></h1>
                    <span>BLOG</span>
                </div>
                
                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li>
                            <a href="IndexServlet"><fmt:message key="home"/></a>
                        </li>
                        <li>
                            <a href="PostServlet">Blog</a>
                        </li>
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
        <div id="main">
            <div class="container">
               
                 <header>
                                <center>
                                    <h2>Welcome <font color="orange">${usuario.username}</font>
                                    </h2>
                                </center>
                            </header>
                <div class="patata" align="center">
                        <form action="EditProfileServlet" method="post" enctype="multipart/form-data">
                            <div class="2u" align="center">
                                <br>
                                <center>
                                    <img height = "100px" width = "100px" src="ShowUserImage?userId=${usuario.userId}">
                                </center>
                                <br>
                                First name: <input type="text" name="nombre" value= "${usuario.name}" required="true">
                                <br>
                                Last name: <input type="text" name="apellido" value= "${usuario.lastName}" required="true"/>
                                <br>
                                Email: <input type="email" name="email" value = "${usuario.email}" required="true" />
                                <br>
                                WebSite: 
                                <input type="text" name="website"   value = "${usuario.email}"/>
                                <br>
                                Description: 
                                <input type="text" name="descriptionSingUp"  value = "${usuario.description}"/>
                                <br>
                                Twitter: 
                                <input type="text" name="twitterSingUp"  value = "${usuario.twitter}" />
                                <br>
                                Facebook: 
                                <input type="text" name="facebookSingUp"  value = "${usuario.facebook}" />
                                <br>
                                Instagram: 
                                <input type="text" name="instagramSingUp"  value = "${usuario.instagram}"/>
                                <br>
                                Linkedin: 
                                <input type="text" name="linkedinSingUp"  value = "${usuario.linkedin}"/>
                                <br>
                                Select new image:
                                <input type="file" name="image" accept="image/*"><br> 
                                <br> 
                                               
                            </div>    
                            <center>
                                <input type="submit" value="Update profile">
                            </center>
                        </form>
                </div>
            </div>
        </div>
        <div id="copyright">
            <div class="container">
            </div>
        </div>
    </body>
</html>
