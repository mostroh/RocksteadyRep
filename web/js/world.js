var locations = [
    ['Tomorroworld', 33.640013, -84.712830],
    ['Tomorrowland', 51.091660, 4.385337],
    ['Viña Rock', 39.266325, -2.600053],
    ['BBK live BILBAO', 43.266886, -2.936139],
    ['PinkPop', 50.882911, 6.019909]
];

var map = new google.maps.Map(document.getElementById('map_world'), {
    zoom: 3,
    center: new google.maps.LatLng(43.266886, -2.936139),
    mapTypeId: google.maps.MapTypeId.ROADMAP
});

var infowindow = new google.maps.InfoWindow();

var marker, i;

for (i = 0; i < locations.length; i++) {
    marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
    });

    google.maps.event.addListener(marker, 'click', (function (marker, i) {
        return function () {
            infowindow.setContent(locations[i][0]);
            infowindow.open(map, marker);
        };
    })(marker, i));
}