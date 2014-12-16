<%-- 
    Document   : newPost
    Created on : 14-dic-2014, 20:11:09
    Author     : Blackproxy
--%>

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
                    <h1><a href="index.html">Rocksteady</a></h1>
                    <span>BLOG</span>
                </div>

                <!-- Nav -->
                <nav id="nav">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li class="active"><a href="/RocksteadyRep/PostServlet">Blog</a></li>
                    </ul>
                </nav>

            </div>
        </div>
        <!-- Header -->

        <!-- Main -->
        <div id="main">
            <div class="container">
                <div class="row">

                    <!-- Content -->
                    <div id="content" class="12u skel-cell-important">
                        <section>
                            <header>
                                <h2>NEW POST</h2>
                            </header>
                            <form action="/RocksteadyRep/NewPostServlet">
                                Title: <br>
                                <input type="text" name="postTitle" value="" /><br>
                                Ubication: <br>
                                <input type="text" name="postGPS" value="" /><br>
                                Latitude:<br>
                                <input type="text" name="postLat" value="" /><br>
                                Longitude:<br>
                                <input type="text" name="postLong" value="" /><br>
                                Image:<br>
                                <input type="file" name="postImage" value="" /><br>
                                Content:<br>
                                <textarea name="postContent" rows="15" cols="100"></textarea><br>
                                <input type="submit" value="POST" name="btnPost" />
                                <form>

                                    </section>
                                    </div>
                                    <!-- /Content -->

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
