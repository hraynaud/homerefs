var HomeRefs = window.HomeRefs || {};

HomeRefs.Reviewer = (function(){

  var fieldArray ;
  var fieldArrayIds = [];

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

  function init(){

    if($("#review_form").length > 0){

      fieldArray= $("#review_form").data("allfields")
      fieldArray.forEach(function(item){
        fieldArrayIds.push("#"+item);
      });

      fieldArrayIds.forEach(function(item){
        hiddenItem = "#_" + item.substring(1);
        $(item).slider({
          range: "min",
          min: 1,
          max: 5,
          value: $(hiddenItem).val() || 3
        });
      });

      $('.slider').slider();

      $("#review_form").bind('submit', submitWithAjax);

      $("ul.bldg-stats.row").click(function (el){
        document.location.href ='buildings/' + $(this).attr("data-bldg-id");
      });

      $("ul.bldg-stats.row").tooltip();

      $("li[rel=popover]").popover({placement: 'left'});
    }
  }

  return {
    init: init
  }


}());







$(function() { 

});

HomeRefs.Reviewer.init();
