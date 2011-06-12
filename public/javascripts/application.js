// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
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