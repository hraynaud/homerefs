$(function() {
  $('.slider').slider();
});


var field_array = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

function updateValues(){

  $( "#_cleanliness").val( $( "#cleanliness").slider("value"));
  $( "#_pests").val( $( "#pests").slider("value"));
  $( "#_sunlight").val( $( "#sunlight").slider("value"));
  $( "#_convenience").val( $( "#convenience").slider("value"));
  $( "#_noise_level").val( $( "#noise_level").slider("value"));
  $( "#_ceilings").val( $( "#ceilings").slider("value"));
  $( "#_closet_space").val( $( "#closet_space").slider("value"));
  $( "#_intercom_system").val( $( "#intercom_system").slider("value"));
  $( "#_temp_control").val( $( "#temp_control").slider("value"));
  $( "#_appliances").val( $( "#appliances").slider("value"));
  $( "#_countertops").val( $( "#countertops").slider("value"));
  $( "#_floors").val( $( "#floors").slider("value"));
  $( "#_bathrooms").val( $( "#bathrooms").slider("value"));
  $( "#_walls").val( $( "#walls").slider("value"));
  $( "#_utilities").val( $( "#utilities").slider("value"));
  $( "#_neighbors").val( $( "#neighbors").slider("value"));
  $( "#_laundry").val( $( "#laundry").slider("value"));
  $( "#_mass_transit").val( $( "#mass_transit").slider("value"));
  $( "#_neighborhood").val( $( "#neighborhood").slider("value"));
  $( "#_storage").val( $( "#storage").slider("value"));
  $( "#_packages").val( $( "#packages").slider("value"));
  $( "#_super").val( $( "#super").slider("value"));
};

function submitWithAjax() {
  updateValues();
  $.post(this.action, $(this.serialize(), null, "script"));
  return false;
}


$("#new_review").bind('submit', submitWithAjax);

$(function() {
  field_array.forEach(function(item){
    $("#new_review").append("<input type='hidden' name='review[" + item + "]', id='_" + item + "'>");
  });

  $( "#cleanliness, #pests, #sunlight, #convenience, #noise_level, #ceilings, #closet_space, #intercom_system, #temp_control, #appliances, #countertops, #floors, #bathrooms, #walls, #utilities, #neighbors, #laundry, #mass_transit, #neighborhood, #storage, #packages, #super"
   ).slider({
     orientation: "horizontal",
     range: "min",
     max: 100,
     value: 50
   });

});

