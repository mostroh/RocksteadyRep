<%-- 
    Document   : admin
    Created on : Dec 13, 2014, 4:41:36 PM
    Author     : EduardROckerse
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello admin!</h1>
        <button type="button" onclick="alert('Loading users...')">Edit users!</button>
        <div style="display: none;" id="hiddenText">
            <li>User 1</li>
            <li>User 2</li>
            <li>User 3</li>
            <li>User 4</li>
            <li>User 5</li>
        </div>
        <div id="showText"><a href="#" onclick="document.getElementById('hiddenText').style.display = 'block';
                              document.getElementById('showText').style.display = 'none';">Click here to see hidden text.</a></div>
    </body>
</html>
