<%-- 
    Document   : editPost
    Created on : 18-dic-2014, 12:58:03
    Author     : Blackproxy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    <h1><a href="index.html">Rocksteady</a></h1>
                    <span>BLOG</span>
                </div>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="/RocksteadyRep/PostServlet">Blog</a></li>
                        <c:if test="${empty usuario}">
                            <li>
                                <a href="/RocksteadyRep/SingUp.jsp">Sign Up</a>
                            </li>
                        </c:if>
                        <c:if test="${usuario.userType == 1}">
                            <li><a href="admin.jsp">Admin Area</a>
                        </c:if>
                        <c:if test="${not empty usuario}">
                            <li>
                                <a href="LogOutServlet">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>

            </div>
        </div>
        <!-- Header -->

        <!-- Main -->
        <div id="main">
            <div class="row">

                <!-- Content -->
                <div id="content" class="12u skel-cell-important">
                    <c:if test="${not empty usuario}" >
                        <c:if test="${usuario.userType <= 2}">
                            <div class="container">

                                <section>
                                    <header>
                                        <h2>EDIT POST</h2>
                                    </header>
                                    <form action="/RocksteadyRep/ConfirmEditPostServlet" method="post" enctype="multipart/form-data">
                                        <input type="hidden" name="postId" value="${postToEdit.getPostId()}"
                                        Title: <br>
                                        <input type="text" name="postTitle" required="true" value="${postToEdit.getTitle()}"/><br>
                                        Latitude:<br>
                                        <input type="text" name="postLat" value="${postLat}"/><br>
                                        Longitude:<br>
                                        <input type="text" name="postLong" value="${postLong}"/><br>
                                        Image:<br>
                                        <h6 style="color:red"> 2040 x 240 px</h6>
                                        <input type="file" name="postImage" accept="image/*" ><br>
                                        Content:<br>
                                        <textarea name="postContent" rows="15" cols="100" required="true">${postToEdit.getPostContent()}</textarea><br>

                                        <input type="submit" value="EDIT POST" name="btnPost" />

                                    </form>

                                </section>
                            </div>
                            <!-- /Content -->


                        </c:if>
                        <c:if test="${usuario ne postToEdit.postedBy}" >
                            <center><h2>YOU HAVE NOT ENOUGH PERMISSIONS TO ACCESS THIS PAGE</h2></center>
                        </c:if>
                    </c:if>
                    <c:if test="${empty usuario}">
                        <center><h2>YOU MUST BE LOGED IN TO ACCESS THIS PAGE</h2></center>
                    </c:if>
                </div>

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
