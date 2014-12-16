function cargarMapa(idPost,gps){
    var gpsSplit = gps.toString().split(",");
    var lat = gpsSplit[0];
    var long = gpsSplit[1];
    $("#mapa"+idPost.toString()).click(function(){
        $("#mostrarMapa"+idPost.toString()).load("/RocksteadyRep/maps.jsp?latitud="+lat+"&longitud="+long);
    });
}