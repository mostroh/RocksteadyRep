var map;
var markers = [];

function initialize(marcadores) {
    var mapOptions = {
        zoom: 12,
        center: posicion
    };
    map = new google.maps.Map(document.getElementById("worldMap"), mapOptions);
    addAllMarker(marcadores);
}

function addAllMarkers(marcadores){
    for(m in marcadores){
        addMarker(m);
    }
}

function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}
// Sets the map on all markers in the array.
function setAllMap(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

// Removes the markers from the map, but keeps them in the array.
function clearMarkers() {
  setAllMap(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}

function loadScript() {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "http://maps.googleapis.com/maps/api/js?v3&key=AIzaSyAgG5LgI0PmcY0nFxyecNOJEWhVIrQjdWs&sensor=false&callback=initialize";
    document.body.appendChild(script);
}

window.onload = loadScript;
google.maps.event.addDomListener(window, 'load', initialize());