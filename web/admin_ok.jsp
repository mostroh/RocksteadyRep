<%-- 
    Document   : admin
    Created on : Dec 13, 2014, 4:41:36 PM
    Author     : EduardROckerse
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
        <title>Blog - Rocksteady Blog</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href='http://fonts.googleapis.com/css?family=Oxygen:400,300,700' rel='stylesheet' type='text/css'>
        <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-panels.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
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
        <!-- Header -->

        <!-- Main -->
        <div id="main">
            <div class="container">
                <header>
                    <center>
                        <h3>
                            <c:choose>
                                <c:when test="${adminActionData.option eq 'setAdmin'}">
                                    <fmt:message key="user"/> <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>admin</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'setRegistered'}">
                                  <fmt:message key="user"/> <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>a <fmt:message key="Registred"/> <fmt:message key="user"/></h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'setWriter'}">
                                   <fmt:message key="user"/> <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>writer</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deleteUser'}">
                                    <fmt:message key="user"/> <font color="red">${adminActionData.username}</font> <fmt:message key="deleted"/> : 
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deletePost'}">
                                    <fmt:message key="postSuccessfully"/>
                                    <br><br>
                                    <h2><fmt:message key="postSuccessfullyDeleted"/></h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deleteComment'}">
                                     <fmt:message key="commentSuccessfully"/>
                                    <br><br>
                                    <h2><fmt:message key="deleted"/></h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'mvp'}">
                                    <fmt:message key="PostsuccessfullySetAs"/>
                                    <br><br>
                                    <h2>MVP</h2>
                                </c:when>
                            </c:choose>
                        </h3>
                    </center>
                    <br><br>
                </header>

                <center>

                    <div id="nav">
                        <ul> 
                            <li class="active"><a href="admin.jsp">Back to admin panel</a></li>
                        </ul>
                    </div>
                </center>


            </div>
        </div>
            <!-- Main -->


            <!-- Copyright -->
            <div id="copyright">
                <div class="container">
                    Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
                </div>
            </div>

    </body>
</html>
