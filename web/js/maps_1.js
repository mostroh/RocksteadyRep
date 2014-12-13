function initialize() {

    latitud = 36.728541;
    longitud = -4.423174;
    var posicion = new google.maps.LatLng(latitud, longitud);

    var mapOptions = {
        center: posicion,
        zoom: 14,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);

    var marker = new google.maps.Marker({
        position: posicion,
        title: "Posicion"
    });
    marker.setMap(map);
}

