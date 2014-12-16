<!DOCTYPE html>
<html>
    <head>
        <title>Asynchronous Loading</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <style>
            #map{
                height: 400px;
                width: 1200px;
                margin: 0px;
                padding: 0px
            }
        </style>
        <script>
            function initialize() {
                var posicion = new google.maps.LatLng(${latitud}, ${longitud});
                var mapOptions = {
                    zoom: 8,
                    center: posicion
                };
                var map = new google.maps.Map(document.getElementById('map'),
                        mapOptions);
                var marker = new google.maps.Marker({
                    position: posicion,
                    map: map,
                    title: 'Posicion'
                });
            }
            function loadScript() {
                var script = document.createElement('script');
                script.type = 'text/javascript';
                script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
                        'callback=initialize';
                document.body.appendChild(script);
            }
            window.onload = loadScript;
        </script>
    </head>
    <body>
        <h1>MAPA</h1>
        <div id="map" ></div>
    </body>
</html>









