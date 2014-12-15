

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
        <style type="text/css">
            html { height: 100% }
            body { height: 100%; margin: 0; padding: 0 }
            #map_canvas { height: 100% }
        </style>

        <script type="text/javascript"
                src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAgG5LgI0PmcY0nFxyecNOJEWhVIrQjdWs&sensor=false">
        </script>
        <script type="text/javascript" src="/js/maps.js"></script>

    </head>
    <!-- coordenadas(latitud,longitud,texto(String) -->
    <body onload="coordenadas(latitud,longitud,'<h1>'+Titulo+'</h1>')">
        <div id="map" style="width:100%; height:100%"></div>
    </body>
</html>