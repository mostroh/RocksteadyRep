

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <script type="text/javascript"
                src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAgG5LgI0PmcY0nFxyecNOJEWhVIrQjdWs&sensor=false">
        </script>
        <script type="text/javascript" src="maps.js"></script>

    </head>
    <!-- coordenadas(latitud,longitud,texto(String) -->
    <body onload="coordenadas(${latitud},${longitud},'Titulo')">
        <div id="map" style="width:1200px; height:400px"></div>
    </body>
</html>