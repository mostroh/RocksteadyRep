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
                        <li><a href="blog.html">Blog</a></li>
                    </ul>
                </nav>

            </div>
        </div>
        <!-- Header -->

        <!-- Main -->
        <div id="main">
            <div class="container">
                <header>
                    <center><h2>Hello < ${allData.adminName} ></h2></center><br><br>
                </header>
                <div class="row">

                    <div class="3u">
                        <section>
                            <form action="AdminUsersFilteredServlet">
                                <fieldset>
                                    <legend><b>Edit users</b></legend>
                                    Filter by:<br>
                                    <input type="text" name="usernameSearchFilter">
                                    <br>
                                    <br><br>
                                    <input type="submit" value="Search"></fieldset>
                            </form>
                        </section>
                    </div>
                    <div class="3u">
                        <section>
                            <form action="AdminPostByUserServlet">
                                <fieldset>
                                    <legend><b>Delete post</b></legend>
                                    From user:<br>
                                    <input type="text" name="postsByUserFilter">
                                    <br>
                                    <br><br>
                                    <input type="submit" value="Find posts"></fieldset>
                            </form>
                        </section>
                    </div>
                    <div class="3u">
                        <section>
                            <form action="AdminCommentByUserServlet">
                                <fieldset>
                                    <legend><b>Delete comment</b></legend>
                                    From user:<br>
                                    <input type="text" name="commentsByUserFilter">
                                    <br>
                                    <br><br>
                                    <input type="submit" value="Find comments"></fieldset>
                            </form>
                        </section>
                    </div>
                </div>
                <!-- SEARCH RESULTS: -->

                <c:choose>
                    <c:when test="${allData.searchOption == 1}"><header>
                            <c:choose><c:when test="${not empty allData.userList}"><br><br><center><h2>User list:</h2></center>
                                </header></c:when>
                                <c:when test="${empty allData.userList}"><br><br><center><h2><font color="red">No users found</font></h2></center>
                                </header></c:when>
                            </c:choose>

                        <c:forEach items="${allData.userList}" var="user">
                            <li>${user.username}</li>
                            </c:forEach>
                        </c:when>

                    <c:when test="${allData.searchOption == 2}"><header>
                            <br><br><center><h2>Post list:</h2></center>
                        </header>

                        <c:forEach items="${allData.postList}" var="post">
                            <li>${post.postContent}</li>
                            </c:forEach>
                        </c:when>

                    <c:when test="${allData.searchOption == 3}"><header>
                            <br><br><center><h2>Post list:</h2></center>
                        </header>

                        <c:forEach items="${allData.commentList}" var="c">
                            <li>${c.commentContent}</li>
                            </c:forEach>
                        </c:when>
                    </c:choose>

                <!-- SEARCH RESULTS -->

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