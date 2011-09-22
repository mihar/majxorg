rad = function(x) {return x*Math.PI/180;}

distHaversine = function(p1, p2) {
  var R = 6371; // earth's mean radius in km
  var dLat  = rad(p2.lat - p1.lat);
  var dLong = rad(p2.lng - p1.lng);

  var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.cos(rad(p1.lat)) * Math.cos(rad(p2.lat)) * Math.sin(dLong/2) * Math.sin(dLong/2);
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
  var d = R * c;

  return Math.round(d);
}

calculateDistance = function(position) {
  displayLocation()
  $("#distance").text(distHaversine({lat: position.coords.latitude, lng: position.coords.longitude}, current_location) + " km")
}

displayLocation = function() {
  $("#user_distance").show()
  $("#geolocating").hide()
}

$(function() {
  // Geolocation.
  $("#user_distance").hide()
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(calculateDistance, displayLocation)
    navigator.geolocation.watchPosition(calculateDistance)
  } else {
    displayLocation()
  }
  
  function slide_down_location() {
    $("#map").slideDown()
    $(this).unbind('mouseover')
  }
  
  $("#location").mouseover(slide_down_location)
  
  $("#location_hide").click(function() {
    $("#map").slideUp()
    $("#location").mouseover(slide_down_location)
    return false
  })
  
  var fixed = false;

  $(document).scroll(function() {
    if( $(this).scrollTop() >= 75 ) {
      if( !fixed ) {
        fixed = true;
        $('#side').css({position: 'fixed', top: "25px"});
      }                                          
    } else {
      if( fixed ) {
        fixed = false;
        $('#side').css({position:'absolute', top: "100px"});
      }
    }
  });
  
})
