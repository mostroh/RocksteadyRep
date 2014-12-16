<!DOCTYPE html>
<html>
    <head>
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
                var mapOptions = {
                    zoom: 8,
                    center: new google.maps.LatLng(-34.397, 150.644),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                var map = new google.maps.Map(document.getElementById("map"), mapOptions);
            }

            function loadScript() {
                var script = document.createElement("script");
                script.type = "text/javascript";
                script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAgG5LgI0PmcY0nFxyecNOJEWhVIrQjdWs&sensor=false&callback=initialize";
                document.body.appendChild(script);
            }
            window.onload = loadScript;
        </script>
    </head>
    <body>
        <h1>LOCALIZACION</h1>
        <div id="map"></div>
        <img src="http://www.w3schools.com/images/w3schools_green.jpg">

    </body>
</html>









