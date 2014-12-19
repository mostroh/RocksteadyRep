<%-- 
    Document   : admin
    Created on : Dec 13, 2014, 4:41:36 PM
    Author     : EduardROckerse
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
                        
            </div>
        </div>
        <!-- Header -->
        <c:if test="${usuario.userType == 1}">
            <!-- Main -->
            <div id="main">
                <div class="container">
                    <header>
                        <center>
                            <h2><fmt:message key="Hello"/> <font color="orange"> ${usuario.username}</font>
                            </h2>
                        </center>
                        <br><br>
                    </header>
                    <div class="row">

                        <div class="3u">
                            <section>
                                <form action="AdminUsersFilteredServlet">
                                    <fieldset>
                                        <legend><b><fmt:message key="EditUsers"/></b></legend>
                                       <fmt:message key="FilterBy"/>:<br>
                                        <input type="text" name="usernameSearchFilter">
                                        <br>
                                        <br><br>
                                        <input type="submit" value="<fmt:message key="sreach"/>"></fieldset>
                                </form>
                            </section>
                        </div>
                        <div class="3u">
                            <section>
                                <form action="AdminPostByUserServlet">
                                    <fieldset>
                                        <legend><b><fmt:message key="DeletePost"/></b></legend>
                                        <fmt:message key="FromUser"/>:<br>
                                        <input type="text" name="postsByUserFilter">
                                        <br>
                                        <br><bzq>
                                        <input type="submit" value="<fmt:message key="findPost"/>"></fieldset>
                                </form>
                            </section>
                        </div>
                        <div class="3u">
                            <section>
                                <form action="AdminCommentByUserServlet">
                                    <fieldset>
                                        <legend><b><fmt:message key="DeleteComment"/></b></legend>
                                        <fmt:message key="FromUser"/>:<br>
                                        <input type="text" name="commentsByUserFilter">
                                        <br>
                                        <br><br>
                                        <input type="submit" value="<fmt:message key="findComment"/>"></fieldset>
                                </form>
                            </section>
                        </div>
                        <div class="3u">
                            <section>
                                <form action="AdminMakeMVPostServlet">
                                    <fieldset>
                                        <legend><b><fmt:message key="selectMVPost"/></b></legend>
                                        <fmt:message key="remember"/>, <fmt:message key="MVPshowsonHOMEpage"/>...<br>
                                        <br><br>
                                        <input type="submit" value="<fmt:message key="getPost"/>"></fieldset>
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
                                            <h2><font color="red"><fmt:message key="noUsersFound"/></font></h2></center>
                                    </header>
                                </c:when>
                                <c:when test="${not empty allData.userList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2><font color="green"><fmt:message key="usersFound"/>:</font></h2>
                                        </center>
                                    </header>
                                    <table style="width:100%">
                                        <tr>
                                            <th><b><fmt:message key="userName"/></b></th>
                                            <th><b><fmt:message key="userLevel"/></b></th>
                                            <th><b><fmt:message key="performAction"/></b></th>
                                        </tr>
                                        <c:forEach items="${allData.userList}" var="user">

                                            <tr>
                                                <td>${user.username}</td>
                                                <c:choose>
                                                    <c:when test="${user.userType == 1}">
                                                        <td>Admin</td>
                                                    </c:when>
                                                    <c:when test="${user.userType == 2}">
                                                        <td><fmt:message key="Writer"/></td>
                                                    </c:when>
                                                    <c:when test="${user.userType == 3}">
                                                        <td><fmt:message key="Registred"/></td>
                                                    </c:when>
                                                </c:choose>

                                                <td>
                                                    <c:if test="${user.userId ne usuario.userId}">
                                                        <form action="AdminEditUserServlet">
                                                            <select name="userEdit" onchange="this.form.submit();">
                                                                <option value="default">Select action...</option>
                                                                <option value="setAdmin${user.userId}"><fmt:message key="setadmin"/></option>
                                                                <option value="setWriter${user.userId}"><fmt:message key="setWriter"/></option>
                                                                <option value="setRegistered${user.userId}"><fmt:message key="setRegistred"/></option>
                                                                <option value="deleteUser${user.userId}"><fmt:message key="deleteUser"/></option>
                                                            </select>
                                                        </form>   
                                                    </c:if>
                                                    <c:if test="${user.userId eq usuario.userId}">
                                                        <font color="red">
                                                        <fmt:message key="thisIsMe"/>
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
                                            <h2><font color="red"><fmt:message key="noPostFound"/>.</font></h2>
                                            <br>
                                            <h5><fmt:message key="pleaseMakeSureUsernameIsValid"/>.</h5>
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
                                            <button onclick="this.form.submit();" value="${post.postId}" name="postIDtoDelete"><fmt:message key="DeletePost"/></button>
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
                                        <center><h2><font color="red"><fmt:message key="pleaseMakeSureUsernameIsValid"/><fmt:message key="noComentFound"/>.</font></h2>
                                            <br><h5><fmt:message key="pleaseMakeSureUsernameIsValid"/>.</h5></center>
                                    </header></c:when>
                                <c:when test="${not empty allData.commentList}">
                                    <br><br>
                                    <header>
                                        <center><h2><font color="green"><fmt:message key="comentFound"/>:</font></h2></center>
                                    </header>
                                    <c:forEach items="${allData.commentList}" var="c">
                                        <li>${c.commentContent}
                                            <form action="AdminDeleteCommentServlet">
                                                <button onclick="this.form.submit();" value="${c.commentId}" name="commentIDtoDelete"><fmt:message key="DeleteComment"/></button>
                                            </form>  
                                        </li>
                                    </c:forEach>

                                </c:when>
                            </c:choose>
                        </c:when>

                        
                        <c:when test="${allData.searchOption == 4}">
                            <c:choose>
                                <c:when test="${empty allData.postList}">
                                    <br><br>
                                    <header>
                                        <center>
                                            <h2>
                                                <font color="red"><fmt:message key="noPostFound"/>..<fmt:message key="getPeoplePosting"/> </font>
                                            </h2>
                                        </center>
                                    </header>
                                </c:when>
                                <c:when test="${not empty allData.postList}">
                                    <c:forEach items="${allData.postList}" var="post">
                                        <li><b> ${post.title}</b>
                                            <br>
                                            ${post.postDate}
                                        </li>
                                        <form action="AdminNewMVPostServlet">
                                            <button onclick="this.form.submit();" value="${post.postId}" name="postIDtomakeMVP"><fmt:message key="makeMVPost"/></button>
                                        </form> 
                                        <br>
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
                                    <fmt:message key="YoureNotAnAdmin"/>.
                                    <br><br><br>
                                     <fmt:message key="getOut"/>.
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
