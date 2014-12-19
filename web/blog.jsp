<%-- 
    Document   : blog
    Created on : 14-dic-2014, 19:40:33
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
        <script src="js/initializeMAPS.js" type="text/javascript"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css"/>
        <link rel="stylesheet" href="css/style.css"/>
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
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
                                </li>
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




        <!-- Main -->
        <div id="main">

            <div class="container">

                <!--                <div class="row">-->
                <!--                    <div id="content" class="12u skel-cell-important">-->
                <header>
                    <center><h2><fmt:message key="PostList"/></h2></center>
                </header>
                <!--</div>-->
                <!--</div>-->
                <c:if test="${usuario.userType <= 2}">
                    <center>
                        <div id="nav">
                            <ul> 
                                <li class="newPost">
                                    <a href="newPost.jsp"><fmt:message key="newPost"/></a>
                                </li>

                            </ul>
                        </div>
                    </center>
                    <br><br>
                </c:if>
                <div>
                    <center><h2>Filter post</h2></center>
                    <center><form action="/RocksteadyRep/PostServlet" method="post">
                             <fmt:message key="between"/><input type="date" name="dateFrom"/> and <input type="date" name="dateTo"/><br>
                            <input type="submit" value="Filter" name="btnFilter" />
                        </form></center>
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
                                    <span class="byline">
                                        <c:choose>
                                            <c:when test="${empty post.postedBy.getImg()}">
                                                <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${post.postedBy.userId}">
                                                    <img src="images/default-user.png" alt="UserImage" width="30px" height="30px"/>
                                                </a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${post.postedBy.userId}">
                                                    <img height = "30px" width = "30px" src="ShowUserImage?userId=${post.postedBy.userId}" alt="userImage"/>
                                                </a>
                                            </c:otherwise>
                                        </c:choose>
                                        <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${post.postedBy.userId}">${post.postedBy.username}</a>
                                        | ${post.postDate}
                                        <c:if test="${post.postedBy.userId eq usuario.userId}"> |
                                            <form style='display:inline;' action="/RocksteadyRep/EditPostServlet" method="post">
                                                <input style='display:inline;' type="hidden" name="PostToEdit" value="${post.postId}"/>
                                                <input style='display:inline;' type="image" src="images/edit_icon.png" alt="Edit Post"/>
                                            </form> 
                                            <form style='display:inline;' action="/RocksteadyRep/AdminDeletePostServlet" method="post">
                                                <input style='display:inline;' type="hidden" name="DeleteOwnPost" value="${post.postId}"/>
                                                <input style='display:inline;' type="image" src="images/delete_icon.png" alt="Delete Post"/>
                                            </form>
                                            </a>
                                        </c:if>
                                    </span>

                                </header>
                                <c:if test="${not empty post.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "300px" width = "1200px" src="ShowImages?postId=${post.getPostId()}" alt="Imagen Post ${post.getPostId()}"/></a></p>
                                        </c:if>
                                        <c:if test="${empty post.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "300px" width = "1200px" src="images/RockSteadyPost.jpg" alt="Imagen Post ${post.getPostId()}"/></a></p>
                                        </c:if>

                                <p>${post.getPostContent()}</p>

                                <c:choose>
                                    <c:when test="${post.getPostGps() eq ','}">
                                    </c:when>
                                    <c:otherwise>
                                        <div id="mostrarMapa${post.getPostId()}"><br>
                                            <center><a onclick="cargarMapa(${post.getPostId()}, '${post.getPostGps()}')"><img lborder="0" src="images/Google-Maps-icon.png" width="50" height="50" alt="Icono mapa" />Show map</a></center>
                                        </div> 
                                    </c:otherwise>
                                </c:choose>

                            </section>

                        </div>
                        <div>
                            <c:choose>
                                <c:when test="${not empty usuario}">
                                    <c:forEach items="${post.getComentarioCollection()}" var="comentario">
                                        <div class="container">
                                            <header>
                                                <p><hr></p>
                                                <h4>
                                                    <c:choose>
                                                        <c:when test="${empty comentario.commentBy.getImg()}">
                                                            <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${comentario.commentBy.userId}">
                                                                <img src="images/default-user.png" alt="UserImage" width="20px" height="20px"/>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${comentario.commentBy.userId}">
                                                                <img height = "20px" width = "20px" src="ShowUserImage?userId=${comentario.commentBy.userId}"/>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a href="/RocksteadyRep/ViewProfileServlet?profileOfUserID=${comentario.commentBy.userId}">${comentario.getCommentBy().getUsername()} </a>| ${comentario.getCommentDate()}  
                                                    <c:if test="${comentario.commentBy.userId eq usuario.userId}"> |
                                                        <form style='display:inline;' action="/RocksteadyRep/AdminDeleteCommentServlet" method="post">
                                                            <input style='display:inline;' type="hidden" name="DeleteOwnComment" value="${comentario.commentId}"/>
                                                            <input style='display:inline;' type="image" src="images/delete_icon.png" alt="Delete Comment"/>
                                                        </form>
                                                    </c:if>
                                                </h4>
                                                <p>${comentario.getCommentContent()}</p>
                                            </header>
                                        </div>
                                    </c:forEach>
                                    <form action="/RocksteadyRep/CommentServlet" method="post">
                                        <fmt:message key="Comment"/>:<br>
                                        <textarea name="commentContent" rows="4" cols="100"></textarea><br>
                                        <input type="hidden" name="postCommented" value="${post.getPostId()}"/>
                                        <input type="submit" value="Add comment" name="btnComment${post.getPostId()}" />
                                    </form>
                                </c:when>
                                <c:when test="${empty usuario}">
                                    <center><h5>ONLY REGISTERED MEMBERS CAN SEE COMMENTS</h5></center>
                                    </c:when>
                                </c:choose>
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
