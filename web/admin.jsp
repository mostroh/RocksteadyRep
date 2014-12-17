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
                                <a href="LogOutServlet">Logout</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- Header -->
        <c:if test="${usuario.userType == 1}">
            <!-- Main -->
            <div id="main">
                <div class="container">
                    <header>
                        <center>
                            <h2>Hello <font color="orange"> ${usuario.username}</font>
                            </h2>
                        </center>
                        <br><br>
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

                        <c:when test="${allData.searchOption == 1}">
                            <c:choose>
                                <c:when test="${empty allData.userList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2><font color="red">No users found</font></h2></center>
                                    </header>
                                </c:when>
                                <c:when test="${not empty allData.userList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2><font color="green">Users found:</font></h2>
                                        </center>
                                    </header>
                                    <table style="width:100%">
                                        <tr>
                                            <th><b>Username</b></th>
                                            <th><b>User-level</b></th>
                                            <th><b>Perform action</b></th>
                                        </tr>
                                        <c:forEach items="${allData.userList}" var="user">

                                            <tr>
                                                <td>${user.username}</td>
                                                <c:choose>
                                                    <c:when test="${user.userType == 1}">
                                                        <td>Admin</td>
                                                    </c:when>
                                                    <c:when test="${user.userType == 2}">
                                                        <td>Writer</td>
                                                    </c:when>
                                                    <c:when test="${user.userType == 3}">
                                                        <td>Registered</td>
                                                    </c:when>
                                                </c:choose>

                                                <td>
                                                    <c:if test="${user.userId ne usuario.userId}">
                                                        <form action="AdminEditUserServlet">
                                                            <select name="userEdit" onchange="this.form.submit();">
                                                                <option value="default">Select action...</option>
                                                                <option value="setAdmin${user.userId}">Set Admin</option>
                                                                <option value="setWriter${user.userId}">Set Writer</option>
                                                                <option value="setRegistered${user.userId}">Set Registered</option>
                                                                <option value="deleteUser${user.userId}">Delete User</font></option>
                                                            </select>
                                                        </form>   
                                                    </c:if>
                                                    <c:if test="${user.userId eq usuario.userId}">
                                                        <font color="red">
                                                        This is me
                                                        </font>
                                                    </c:if>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </table>
                                </c:when>
                            </c:choose>


                        </c:when>

                        <c:when test="${allData.searchOption == 2}"><c:choose>
                                <c:when test="${empty allData.postList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2><font color="red">No posts found.</font></h2>
                                            <br>
                                            <h5>Please make sure username is valid.</h5>
                                        </center>
                                    </header>
                                </c:when>
                                <c:when test="${not empty allData.postList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2><font color="green">Post list:</font></h2>
                                        </center>
                                    </header>

                                    <c:forEach items="${allData.postList}" var="post">
                                        <li><b> ${post.title}</b>
                                            <br>
                                            ${post.postDate}
                                        </li>
                                        <form action="AdminDeletePostServlet">
                                            <button onclick="this.form.submit();" value="${post.postId}" name="postIDtoDelete">Delete post</button>
                                        </form> 
                                        <br>
                                    </c:forEach>
                                </c:when>

                            </c:choose>


                        </c:when>

                        <c:when test="${allData.searchOption == 3}">
                            <c:choose>
                                <c:when test="${empty allData.commentList}">
                                    <br><br>
                                    <header>
                                        <center><h2><font color="red">No comments found.</font></h2>
                                            <br><h5>Please make sure username is valid.</h5></center>
                                    </header></c:when>
                                <c:when test="${not empty allData.commentList}">
                                    <br><br>
                                    <header>
                                        <center><h2><font color="green">Comments found:</font></h2></center>
                                    </header>
                                    <c:forEach items="${allData.commentList}" var="c">
                                        <li>${c.commentContent}
                                            <form action="AdminDeleteCommentServlet">
                                                <button onclick="this.form.submit();" value="${c.commentId}" name="commentIDtoDelete">Delete comment</button>
                                            </form>  
                                        </li>
                                    </c:forEach>

                                </c:when>
                            </c:choose>
                        </c:when>

                    </c:choose>
                    <!-- SEARCH RESULTS -->

                </div>
                <!-- Main -->
            </c:if>
            <c:if test="${usuario.userType != 1}">
                <!-- NOT ADMIN -->
                <div id="main">
                    <div class="container">
                        <header>
                            <center>
                                <h2>
                                    <font color="red">
                                    You're not an admin.
                                    <br><br><br>
                                    Get out.
                                    <meta http-equiv="refresh" content="5;url=http://www.keepcalmandposters.com/posters/2566862.png">
                                    </font> 
                                </h2>
                            </center>
                        </header>
                    </div>
                </div>

                <!-- NOT ADMIN -->
            </c:if>

            <!-- Copyright -->
            <div id="copyright">
                Trabajo Java EE - Máster INFTEL
            </div>

    </body>
</html>
