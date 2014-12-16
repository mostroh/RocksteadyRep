<%-- 
    Document   : admin
    Created on : Dec 13, 2014, 4:41:36 PM
    Author     : EduardROckerse
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
        Monochromed by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
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
                        <li><a href="index.html">Home</a></li>
                        <li><a href="/RocksteadyRep/PostServlet">Blog</a></li>
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
                                    User <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>admin</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'setRegistered'}">
                                    User <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>a registered user</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'setWriter'}">
                                    User <font color="green">${adminActionData.username}</font> is now: 
                                    <br><br>
                                    <h2>writer</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deleteUser'}">
                                    User <font color="red">${adminActionData.username}</font> deleted: 
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deletePost'}">
                                    Post by <font color="green">${adminActionData.username}</font>: 
                                    <br><br>
                                    <h2>deleted</h2>
                                </c:when>
                                <c:when test="${adminActionData.option eq 'deleteComment'}">
                                    Comment succesfully 
                                    <br><br>
                                    <h2>deleted</h2>
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
