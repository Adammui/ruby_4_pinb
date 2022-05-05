/*window.initMap= function (address){
    let geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == 'OK') {
            let myCoords = new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng());
            drawMap(myCoords);
        } else {
           // alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}
window.drawMap =function (myCoords) {
    let mapOptions = {
        center: myCoords,
        zoom: 12
    };
    let map = new google.maps.Map(document.getElementById('map'), mapOptions);
    let marker = new google.maps.Marker({
        position: myCoords,
        map: map
    });
}*/