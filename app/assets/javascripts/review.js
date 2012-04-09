$(function() {
  $('.slider').slider();
});


var field_array = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

function updateValues(){

  $(".ui-slider").each(function(){
    var a = $(this).attr("id")
    if ($("#_"+a).length) {
    $("#_"+a).val($(this).slider("value"))
    }
  })

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

