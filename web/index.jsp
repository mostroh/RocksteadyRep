<%-- 
    Document   : index
    Created on : Dec 12, 2014, 2:41:36 PM
    Author     : EduardROckerse
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <div id="logo"> <!-- Logo -->
                <h1><a>Rocksteady</a></h1>
                <span>BLOG</span>
            </div> <!-- Logo -->

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
                <!-- Nav -->
        </div> 
        <!-- Header -->

        <div id="main"> <!-- Main -->
            <c:choose>
                <c:when test="${not empty usuario}">
                    <header>
                        <center>
                            <h2><fmt:message key="welcome"/> <font color="orange">${usuario.username}</font>
                            </h2>
                        </center>
                    </header>
                </c:when>
                <c:when test="${empty usuario}">
                    <header>
                        <center>
                            <h2><fmt:message key="login"/></h2>
                        </center>
                    </header>
                    <center>
                        <div class="3u" align="right">
                            <form action="LoginServlet" method="post" autocomplete="off">
                                <fmt:message key="userName"/>   <input type="text" name="name" required="true"><br><br>
                                <fmt:message key="password"/>   <input type="password" name="pwd"required="true"><br>
                                <input type="submit" value="<fmt:message key="login"/>">
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
                                <h2><font color="red"><fmt:message key="invalidusername"/></font>
                                </h2>
                            </center>
                        </c:when>
                        <c:when test="${lh.wrongpassword}">
                            <center>
                                <h2><font color="red"><fmt:message key="errorContraseña"/></font>
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
                                        <fmt:message key="postedby"/> : ${mvpPost.postedBy.username} </span>
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
                                <a href="/RocksteadyRep/PostServlet" class="button"><fmt:message key="readallposts"/></a>
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
                                <h2><fmt:message key="blogpostsbydate"/></h2>
                            </header>
                            <p><fmt:message key="blogpostsbydatedescr"/></p>
                            <ul class="default">
                                <li><a href="/RocksteadyRep/PostServlet?postYear=2014">2014</a></li>
                                <li><a href="/RocksteadyRep/PostServlet?postYear=2013">2013</a></li>
                                <li><a href="/RocksteadyRep/PostServlet?postYear=2012">2012</a></li>
                                <li><a href="/RocksteadyRep/PostServlet?postYear=2011">2011</a></li>
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

