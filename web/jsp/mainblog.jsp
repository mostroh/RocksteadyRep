<%-- 
    Document   : mainblog
    Created on : 13-dic-2014, 12:51:57
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
	<!--[if lte IE 8]><script src="../js/html5shiv.js"></script><![endif]-->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../js/skel.min.js" type="text/javascript"></script>
        <script src="../js/init.js" type="text/javascript"></script>
        <script src="../js/skel-panels.min.js" type="text/javascript"></script>
	<noscript>
                <link href="../css/skel-noscript.css" rel="stylesheet" type="text/css"/>
                <link href="../css/style.css" rel="stylesheet" type="text/css"/>
	</noscript>
	<!--[if lte IE 8]><link rel="stylesheet" href="../css/ie/v8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="../css/ie/v9.css" /><![endif]-->
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
					<li class="active"><a href="jsp/mainblog.jsp">Blog</a></li>
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
							<h2>POST TITLE</h2>
							<span class="byline">USER | DATE | GPS link</span>
						</header>
						<p><a href="#" class="image full"><img src="../images/pics02.jpg" alt=""></a></p>
						<p>All the content from SELECT p.POST_CONTENT FROM POSTS p. <br> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui sapien, egestas at consequat in, pharetra id enim. In ac mi facilisis sem maximus semper. Praesent ultricies, lectus et rutrum tristique, elit augue dignissim nisi, sed aliquet tellus orci nec nunc. Sed lobortis ipsum enim, at scelerisque libero ultrices non. Phasellus vestibulum aliquet ipsum, ullamcorper dapibus enim semper pretium. Sed vel mauris nulla. Praesent sed sodales tellus. Pellentesque venenatis nisi nec neque posuere, at condimentum tellus sodales. Suspendisse consequat nisl in pulvinar venenatis. Vestibulum auctor magna in arcu pellentesque, id sollicitudin mauris pretium.

							Vivamus a auctor libero. Pellentesque varius sit amet nunc id eleifend. Vivamus tempor diam non eleifend interdum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam aliquet eget tortor a lobortis. Vestibulum bibendum sem nec lacinia commodo. Aliquam varius ante leo, porta pellentesque purus efficitur maximus. Suspendisse a massa vitae orci pretium suscipit.

							Praesent purus dui, fringilla et dui viverra, lobortis rhoncus metus. Proin pellentesque lectus non placerat aliquam. Integer a enim sed justo laoreet pretium. Ut tincidunt augue eget massa ornare, ac auctor elit vestibulum. In hendrerit felis nec porta bibendum. In ut mi sit amet quam auctor laoreet in a ipsum. Fusce varius feugiat mattis. Maecenas eu vestibulum ante. Sed blandit ex id diam pretium varius.

							Donec vestibulum urna eu orci imperdiet ultrices. Etiam tincidunt quam arcu, et pulvinar dolor cursus ut. Donec a odio vulputate, rutrum tortor tempor, pretium libero. Ut blandit nulla quis varius consequat. In vel turpis at ex pulvinar.</p>
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

