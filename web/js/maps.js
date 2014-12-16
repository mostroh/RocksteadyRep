function cargarMapa(idPost, gps) {
    var gpsSplit = gps.toString().split(",");
    var lat = gpsSplit[0];
    var long = gpsSplit[1];

    $("#mostrarMapa" + idPost).load("/RocksteadyRep/maps.jsp");

}