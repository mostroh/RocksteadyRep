<%-- 
    Document   : editPerfil
    Created on : 17 déc. 2014, 23:47:29
    Author     : YSF
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <div id="header">
            <div class="container">
                <div id="logo">
                    <h1><a href="index.html">Rocksteady</a></h1>
                    <span>BLOG</span>
                </div>
                <nav id="nav">
                    <ul>
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="/RocksteadyRep/PostServlet">Blog</a></li>
                        <li class="active"><a href="/RocksteadyRep/SingUp.html">SingUp</a></li>
                         <c:if test="${usuario.userType == 1}">
                            <li><a href="admin.jsp">Admin Area</a>
                            </c:if>
                            <c:if test="${not empty usuario}">
                            <li>
                                <a href="LogOutServlet">Logout</a>
                            </li>
                        </c:if>
                            <c:if test="${not empty usuario}">
                            <li>
                                <a href="editPerfil.jsp">Edit Perfil</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <div id="main">
            <div class="container">
               
                 <header>
                                <center>
                                    <h2>Welcome <font color="orange">${usuario.username}</font>
                                    </h2>
                                </center>
                            </header>
                <div class="patata" align="center">
                        <form action="EditPerfilServlet" method="post" enctype="multipart/form-data">
                            <div class="3u" align="right">
                              
                                First name: <input type="text" name="nombre" value= "<c:out value = "${usuario.name}"/>" required="true"><br>
                                Last name: <input type="text" name="apellido" value= "<c:out value = "${usuario.lastName}"/>" required="true"/><br>
                                Email: <input type="email" name="email" value = "<c:out value = "${usuario.email}"/>" required="true" /><br>
                               
                            
                                WebSite: <input type="text" name="website"   value = "<c:out value = "${usuario.email}"/>"/><br>
                                Description: <input type="text" name="descriptionSingUp"  value = "<c:out value = "${usuario.description}"/>" /><br>
                                Twitter: <input type="text" name="twitterSingUp"  value = "<c:out value = "${usuario.twitter}"/>" /><br>
                                Facebook: <input type="text" name="facebookSingUp"  value = "<c:out value = "${usuario.facebook}"/>" /><br>
                                Instagram: <input type="text" name="instagramSingUp"  value = "<c:out value = "${usuario.instagram}"/>"/><br>
                                Linkedin: <input type="text" name="linkedinSingUp"  value = "<c:out value = "${usuario.linkedin}"/>"/><br><br>
                                Image:<br>
                               Content:<br>
                               <img height = "100px" width = "100px" src="ShowUserImage?userId=${usuario.userId}">
                                Select image: <input type = "file" name="image"  value = "<c:out value = "${usuario.img}"/>"/><br> 
                                               
                            </div>    
                            <center><input type="submit" value="Register"></center>
                            ${Error}
                        </form>
                </div>
            </div>
        </div>
        <div id="copyright">
            <div class="container">
            </div>
        </div>
    </body>
</html>