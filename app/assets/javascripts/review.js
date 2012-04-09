$(function() {
  $('.slider').slider();
});


function hexFromRGB(r, g, b) {
  var hex = [
    r.toString( 16 ),
    g.toString( 16 ),
    b.toString( 16 )
  ];
  $.each( hex, function( nr, val ) {
    if ( val.length === 1 ) {
      hex[ nr ] = "0" + val;
    }
  });
  return hex.join( "" ).toUpperCase();
}
function refreshSwatch() {
  var red = $( "#red" ).slider( "value" ),
  green = $( "#green" ).slider( "value" ),
  blue = $( "#blue" ).slider( "value" ),
  hex = hexFromRGB( red, green, blue );
  $( "#swatch" ).css( "background-color", "#" + hex );
}

function submitWithAjax() {
  alert("submitted via js")
  $.post(this.action, $(this.serialize(), null, "script"));
  return false;
}


$("#new_review").bind('submit', submitWithAjax);

$(function() {
  $( "#cleanliness, #pests, #sunlight, #convenience, #noise_level, #ceilings, #closet_space, #intercom_system, #temp_control, #appliances, #countertops, #floors, #bathrooms, #walls, #utilities, #neighbors, #laundry, #mass_transit, #neighborhood, #storage, #packages, #super"
 ).slider({
    orientation: "horizontal",
    range: "min",
    max: 100,
    value: 50,
    slide: refreshSwatch,
    change: refreshSwatch
  });
});

