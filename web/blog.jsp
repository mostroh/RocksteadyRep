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
        <script src="js/initializeMAPS.js" type="text/javascript"></script>
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
                                <a href="/RocksteadyRep/SingUp.html">Sign Up</a>
                            </li>
                        </c:if>
                        <c:if test="${usuario.userType == 1}">
                            <li><a href="admin.jsp">Admin Area</a>
                            </c:if>
                            <c:if test="${not empty usuario}">
                            <li>
                                <a href="editProfile.jsp">Edit Profile</a>
                            </li>
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

            <div class="container">

                <!--                <div class="row">-->
                <!--                    <div id="content" class="12u skel-cell-important">-->
                <header>
                    <center><h2>POST LIST</h2></center>
                </header>
                <!--</div>-->
                <!--</div>-->
                <c:if test="${usuario.userType <= 2}">
                    <center>
                        <div id="nav">
                            <ul> 
                                <li class="newPost">
                                    <a href="newPost.jsp">New post</a>
                                </li>

                            </ul>
                        </div>
                    </center>
                    <br><br>
                </c:if>

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
                                                <img src="images/default-user.png" alt="UserImage" width="30px" height="30px"/>
                                            </c:when>
                                            <c:otherwise>
                                                <img height = "30px" width = "30px" src="ShowUserImage?userId=${post.postedBy.userId}" alt="userImage">
                                            </c:otherwise>
                                        </c:choose>
                                        ${post.postedBy.username} | ${post.postDate}
                                        <c:if test="${post.postedBy.userId eq usuario.userId}"> |
                                            <form style='display:inline;' action="/RocksteadyRep/EditPostServlet" method="post">
                                                <input style='display:inline;' type="hidden" name="PostToEdit" value="${post.postId}">
                                                <input style='display:inline;' type="image" src="images/edit_icon.png" alt="Edit Post">
                                            </form> 
                                            <form style='display:inline;' action="/RocksteadyRep/AdminDeletePostServlet" method="post">
                                                <input style='display:inline;' type="hidden" name="DeleteOwnPost" value="${post.postId}">
                                                <input style='display:inline;' type="image" src="images/delete_icon.png" alt="Delete Post">
                                            </form>
<!--                                            | <a href="/RocksteadyRep/AdminDeletePostServlet?DeleteOwnPost=${post.postId}">
                                                <font color="red">Remove post</font>-->
                                            </a>
                                        </c:if>
                                    </span>

                                </header>
                                <c:if test="${not empty post.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "300px" width = "1200px" src="ShowImages?postId=${post.getPostId()}" alt="Imagen Post ${post.getPostId()}"></a></p>
                                        </c:if>
                                        <c:if test="${empty post.getHeaderImage()}">
                                    <p><a href="#" class="image full">
                                            <img height = "300px" width = "1200px" src="images/RockSteadyPost.jpg" alt="Imagen Post ${post.getPostId()}"></a></p>
                                        </c:if>

                                <p>${post.getPostContent()}</p>

                                <c:choose>
                                    <c:when test="${post.getPostGps() eq ','}">
                                    </c:when>
                                    <c:otherwise>
                                        <div id="mostrarMapa${post.getPostId()}"><br>
                                            <a onclick="cargarMapa(${post.getPostId()}, '${post.getPostGps()}')" >
                                                <center><img lborder="0" src="images/Google-Maps-icon.png" width="50" height="50" alt="Icono mapa" >Show map</a></center>
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
                                                            <img src="images/default-user.png" alt="UserImage" width="20px" height="20px"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <img height = "20px" width = "20px" src="ShowUserImage?userId=${comentario.commentBy.userId}">
                                                        </c:otherwise>
                                                    </c:choose>
                                                    ${comentario.getCommentBy().getUsername()} | ${comentario.getCommentDate()}  
                                                    <c:if test="${comentario.commentBy.userId eq usuario.userId}"> |
                                                        <form style='display:inline;' action="/RocksteadyRep/AdminDeleteCommentServlet" method="post">
                                                            <input style='display:inline;' type="hidden" name="DeleteOwnComment" value="${comentario.commentId}">
                                                            <input style='display:inline;' type="image" src="images/delete_icon.png" alt="Delete Comment">
                                                        </form>
                                                    </c:if>
                                                </h4>
                                                <p>${comentario.getCommentContent()}</p>
                                            </header>
                                        </div>
                                    </c:forEach>
                                    <form action="/RocksteadyRep/CommentServlet" method="post">
                                        Comment:<br>
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
