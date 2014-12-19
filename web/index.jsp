<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<c:set var="language" value="en" scope="session" />
<fmt:setLocale value="${sessionScope.locale}" />
<fmt:setBundle basename="com.me.jsp.bundle.file" />
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
            <div id="logo"> <!-- Logo -->
                <h1><a>Rocksteady</a></h1>
                <span>BLOG</span>
            </div> <!-- Logo -->

            <nav id="nav"> <!-- Nav -->
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="PostServlet">Blog</a></li>
                        <c:if test="${empty usuario}">
                        <li>
                            <a href="signUp.jsp">Sign Up</a>
                        </li>
                    </c:if>
                    <c:if test="${not empty usuario}">
                        <c:if test="${usuario.userType == 1}">
                            <li>
                                <a href="admin.jsp">Admin Area</a>
                            </c:if>
                        <li>
                            <a href="editProfile.jsp">Edit Profile</a>
                        </li>
                        <li>
                            <a href="LogOutServlet">Logout</a>
                        </li>
                    </c:if>
                </ul>
            </nav> <!-- Nav -->
        </div> <!-- Header -->

        <div id="main"> <!-- Main -->
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
                                UserName:   <input type="text" name="name" required="true"><br><br>
                                Password:   <input type="password" name="pwd"required="true"><br>
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
            <div class="container">
                <div class="row">
                    <!-- Content -->
                    <div class="8u skel-cell-important">
                        <section id="content">
                            <c:if test="${not empty mvpPost}">
                                <header>
                                    <h2>${mvpPost.title}</h2>
                                    <span class="byline"> 
                                        <c:choose>
                                            <c:when test="${empty mvpPost.postedBy.getImg()}">
                                                <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${mvpPost.postedBy.userId}">
                                                    <img src="images/default-user.png" alt="UserImage" width="20px" height="20px"/>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${mvpPost.postedBy.userId}">
                                                    <img height = "20px" width = "20px" src="ShowUserImage?userId=${mvpPost.postedBy.userId}"/>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        postedBy ${mvpPost.postedBy.username} </span>
                                </header>

                                <c:if test="${not empty mvpPost.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "157px" width = "783px" src="ShowImages?postId=${mvpPost.getPostId()}" alt="Imagen Post ${mvpPost.getPostId()}"/></a>
                                    </p>
                                </c:if>
                                <c:if test="${empty mvpPost.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "157px" width = "783px" src="images/RockSteadyPost.jpg" alt="Imagen Post ${mvpPost.getPostId()}"/></a>
                                    </p>
                                </c:if>
                                <p>${fn:substring(mvpPost.postContent, 0, 300)} [...]</p>
                                <a href="/RocksteadyRep/PostServlet" class="button">Read all posts</a>
                            </c:if>


                            <c:if test="${empty mvpPost}">
                                <header>
                                    <h2>MVPost not found</h2>
                                    <span class="byline">  | Date </span>
                                </header>
                                <p>
                                    <a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a>   

                                </p>
                                <p>Ask an admin to set a mvpPost</p>

                            </c:if>
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

