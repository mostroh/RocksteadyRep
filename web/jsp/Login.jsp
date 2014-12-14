<%-- 
    Document   : Login
    Created on : 14-dic-2014, 17:43:53
    Author     : YSF
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     <section class="container">
    <div class="login">
      <h1>Login</h1>
      <form action="LoginServlet" method="post" accept-charset="utf-8" class="form-item">
        <p><input type="text" name="name" id="name" placeholder="user"></p>
        <p><input type="password" name="pwd" placeholder="pasword"></p>
        <p class="remember_me">
          <label>
            <input type="checkbox" name="remember_me" id="remember_me">
            Recordar La Contraseña
          </label>
        </p>
        <div class="form-item-4">
            <p> <input type="submit"  value="Entrar"></p>
            <p> <input type="submit"  name="registrar" value="Registrar" /></p>
        </div>
      </form>
    </div>
         
    <div class="login-help">
       
      <p>Has olvidado tu contraseña? <a href="index.html">Pulsa aqui para recuperar tu contraseña</a>.</p>
    </div>
  </section>

    </body>
</html>
