$(function() {
  $('.slider').slider();
});


var fieldArray = ["cleanliness", "pests", "sunlight", "convenience", "noise_level", "ceilings", "closet_space", "intercom_system", "temp_control", "appliances", "countertops", "floors", "bathrooms", "walls", "utilities", "neighbors", "laundry", "mass_transit", "neighborhood", "storage", "packages", "super"]

function updateValues(){

  $(".ui-slider").each(function(){
    var sliderId = $(this).attr("id")
    if ($("#_"+sliderId).length) {
    $("#_"+sliderId).val($(this).slider("value"))
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
  fieldArray.forEach(function(item){
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

