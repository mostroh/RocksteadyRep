function cargarMapa(idPost, gps) {
    var gpsSplit = gps.toString().split(",");
    var lat = gpsSplit[0];
    var long = gpsSplit[1];
    $("#mostrarMapa" + idPost).load('/RocksteadyRep/maps.jsp?latitud=' + lat + '&longitud=' + long);
}

function initialize(latitud,longitud) {
    
    var posicion = new google.maps.LatLng(latitud,longitud);
    var mapOptions = {
        zoom: 12,
        center: posicion
    };
    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
    var marker = new google.maps.Marker({
        position: posicion,
        map: map,
        title: 'Posicion'
    });
}
function loadScript() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://maps.googleapis.com/maps/api/js?v3&key=AIzaSyAgG5LgI0PmcY0nFxyecNOJEWhVIrQjdWs&sensor=false&callback=initialize";
    document.body.appendChild(script);
}
window.onload = loadScript;
google.maps.event.addDomListener(window, 'load', initialize());
