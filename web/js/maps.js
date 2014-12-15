function initialize() {

    latitud = 43.267804;
    longitud = -2.935055;
    
    var posicion = new google.maps.LatLng(latitud,longitud);
    var mapOptions = {
        zoom: 11,
        center: posicion
    };

    var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
    
    var contentString = '<div id="content">' + '<div id="siteNotice">' +
            '</div>' + '<h1>BBK LIVE Bilbao</h1>' +
            '<div id="bodyContent">' +
            '<p>Enlace <a href=""</a></p>' +
            '</div>' +
            '</div>';

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
google.maps.event.addDomListener(window, 'load', initialize);
