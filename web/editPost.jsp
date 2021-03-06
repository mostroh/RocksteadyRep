<%-- 
    Document   : editPost
    Created on : 18-dic-2014, 12:58:03
    Author     : Blackproxy
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
        <script src="js/latLongMap.js" type="text/javascript"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link href="css/mapStyle.css" rel="stylesheet" type="text/css"/>
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
                                    Festival position (click the map for set a position):
                                    <div id="latLongMap" style="width:800px; height: 300px;"></div><br>
                                    <form action="/RocksteadyRep/ConfirmEditPostServlet">
                                        <input type="hidden" name="postId" value="${pdh.p.postId}"/>
                                        Title: <br>
                                        <input type="text" name="editTitle" required="true" value="${pdh.p.getTitle()}"/><br>
                                        Latitude:<br>
                                        <input id="inLat" type="text" name="editLat" value="${pdh.lat}"/><br>
                                        Longitude:<br>
                                        <input id="inLong" type="text" name="editLong" value="${pdh.lon}"/><br>
                                        Content:<br>
                                        <textarea name="editContent" rows="15" cols="100" required="true">${pdh.p.getPostContent()}</textarea><br>

                                        <input type="submit" value="EDIT POST" name="btnEditPost" />

                                    </form>

                                </section>
                            </div>
                        </c:if>
                        <c:if test="${usuario ne pdh.p.postedBy}" >
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
