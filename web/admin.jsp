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
                        <li><a href="/RocksteadyRep/PostServlet">Blog</a></li>
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
                                                <form action="AdminEditUserServlet">
                                                    <select name="userEdit" onchange="this.form.submit();">
                                                        <option value="default">Select action...</option>
                                                        <option value="setAdmin${user.userId}">Set Admin</option>
                                                        <option value="setWriter${user.userId}">Set Writer</option>
                                                        <option value="setRegistered${user.userId}">Set Registered</option>
                                                        <option value="deleteUser${user.userId}">Delete User</font></option>
                                                    </select>
                                                </form>   
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
                                    <li>${post.title}</li>
                                    <form action="AdminDeletePostServlet">
                                        <button onclick="this.form.submit();" value="${post.postId}" name="postIDtoDelete">Delete comment</button>
                                    </form> 
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


            <!-- Copyright -->
            <div id="copyright">
                <div class="container">
                    Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
                    <br>
                    <a action="LogOutServlet">Logout</a>
                </div>
            </div>

    </body>
</html>
