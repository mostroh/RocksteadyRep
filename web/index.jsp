<%-- 
    Document   : index
    Created on : Dec 16, 2014, 10:25:34 PM
    Author     : inftel13
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
        <title>Home - Rocksteady Blog</title>
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
            <div id="main">
                <div class="container">
                    <c:choose>
                        <c:when test="${not empty usuario}">
                            <header>
                                <center>
                                    <h2>Welcome <font color="orange">${usuario.username}</font>
                                    </h2>
                                </center>
                            </header>
                        </c:when>
                        <c:when test="${empty usuario}">
                            <header>
                                <center>
                                    <h2>Log in</h2>
                                </center>
                            </header>
                            <center>

                                <div class="3u" align="right">
                                    <form action="LoginServlet" method="post" autocomplete="off">
                                        UserName:<input type="text" name="name" required="true"><br><br>
                                        Password: <input type="password" name="pwd"required="true"><br>
                                        <input type="submit" value="Log in">
                                    </form>

                                </div>
                            </center>
                        </c:when>

                    </c:choose>
                    <c:if test="${not empty lh}">
                        <center>
                            <c:choose>
                                <c:when test="${not lh.userexists}">
                                    <center>
                                        <h2><font color="red">Invalid username</font>
                                        </h2>
                                    </center>
                                </c:when>
                                <c:when test="${lh.wrongpassword}">
                                    <center>
                                        <h2><font color="red">Wrong password</font>
                                        </h2>
                                    </center>
                                </c:when>
                            </c:choose>
                        </center>
                    </c:if>



                    <div class="divider"></div>
                </div>
            </div>

            <!-- log in / register (optional) -->
            <div class="container">
                <header>
                    <h2>Last blog posts</h2>
                </header>
                <div class="row">
                    <div class="3u">
                        <section>
                            <a href="#" class="image full"><img src="images/pics01.jpg" alt="" /></a>
                            <p>Title of blog post 1</p>
                        </section>
                    </div>
                    <div class="3u">
                        <section>
                            <a href="#" class="image full"><img src="images/pics11.jpg" alt="" /></a>
                            <p>Title of blog post 2</p>
                        </section>
                    </div>
                    <div class="3u">
                        <section>
                            <a href="#" class="image full"><img src="images/pics12.jpg" alt="" /></a>
                            <p>Title of blog post 3</p>
                        </section>
                    </div>
                    <div class="3u">
                        <section>
                            <a href="#" class="image full"><img src="images/pics13.jpg" alt="" /></a>
                            <p>Title of blog post 4</p>
                        </section>
                    </div>
                </div>
                <div class="divider">&nbsp;</div>
                <div class="row">

                    <!-- Content -->
                    <div class="8u skel-cell-important">
                        <section id="content">
                            <header>
                                <h2>Important blog post title</h2>
                                <span class="byline">User | Date | GPS data link</span>
                            </header>
                            <p><a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a></p>
                            <p>First 100 chars of blog post</p>
                            <a href="#" class="button">All important blog posts.html</a>
                        </section>
                    </div>
                    <!-- /Content -->
                    <!-- Sidebar -->
                    <div id="sidebar" class="4u">
                        <section>
                            <header>
                                <h2>Blog posts by date</h2>
                            </header>
                            <p>For your ease of use you can lookup blog posts by year or month here.</p>
                            <ul class="default">
                                <li><a href="#">2014</a></li>
                                <li><a href="#">2013</a></li>
                                <li><a href="#">2012</a></li>
                                <li><a href="#">2011</a></li>
                            </ul>
                        </section>
                    </div>
                    <!-- Sidebar -->
                </div>

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

