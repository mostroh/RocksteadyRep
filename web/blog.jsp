<%-- 
    Document   : blog
    Created on : 14-dic-2014, 19:40:33
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
        <script src="js/maps.js" type="text/javascript"></script>
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
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="blog.html">Blog</a></li>
                    </ul>
                </nav>

            </div>
        </div>
        <!-- Header -->




        <!-- Main -->
        <div id="main">

            <div class="container">
                <div >
                    <a href="newPost.jsp">NEW POST</a>


                </div>


                <c:forEach items="${postList}" var="post">
                    <div class="row">
                        <br>
                        <br>
                        <!-- Content -->
                        <div id="content" class="12u skel-cell-important">
                            <section>
                                <header>
                                    <h2>${post.getTitle()}</h2>
                                    <span class="byline">${post.getPostedBy().getUsername()} | ${post.getPostDate()} | GPS link</span>
                                </header>
                                <p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                                <p>${post.getPostContent()}</p>
                            </section>
                        </div>
                                <div id="mapa${post.getPostId()}">
                                    <a onclick="cargarMapa(${post.getPostId()},${post.getPostGps()})" href="#mapa${post.getPostId()}">SHOW MAP</a>
                            <div id="mostrarMapa${post.getPostId()}">
                            </div>
                        </div>
                        <!-- /Content -->

                    </div>
                </c:forEach>


            </div>
        </div>
        <!-- Main -->



        <!-- Copyright -->
        <div id="copyright">
            <div class="container">
            </div>
        </div>

    </body>
</html>
