function coordenadas(latitud,longitud,contentString) {
   
    var posicion = new google.maps.LatLng(latitud,longitud);
    var mapOptions = {
        zoom: 11,
        center: posicion
    };

    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    var contentString;

    var infowindow = new google.maps.InfoWindow({
        content: contentString
    });

    var marker = new google.maps.Marker({
        position: posicion,
        map: map,
        title: 'Posicion'
    });
    google.maps.event.addListener(marker, 'click', function () {
        infowindow.open(map, marker);
    });
}
function cargarMapa(idPost,gps,contentStr){
    var gpsSplit = gps.toString().split(",");
    var lat = gpsSplit[0];
    var long = gpsSplit[1];
    $("#mapa"+idPost.toString()).click(function(){
        $("#mostrarMapa"+idPost.toString()).load("/RocksteadyRep/jsp/maps.jsp?latitud=44&longitud=-2");
    });
}

google.maps.event.addDomListener(window, 'load', coordenadas);
