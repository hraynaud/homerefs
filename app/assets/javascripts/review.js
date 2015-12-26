var HomeRefs = window.HomeRefs || {};

HomeRefs.Reviewer = (function(){

  function updateValues(){
    $(".ui-slider").each(function(){
      var sliderId = $(this).attr("id")
      if ($("#_"+sliderId).length) {
        $("#_"+sliderId).val($(this).slider("value"))
      }
    })

  };


  function initSlider(){
    var allFields= $("#review_form").data("allfields")
      , id
      , hiddenId
    ;

    allFields.forEach(function(item){
      id = "#" + item;  
      hiddenId = "#_" + item;

      $(id).slider({
        range: "min",
        min: 1,
        max: 5,
        value: $(hiddenId).val() || 3
      });

    });
  }

  function initFormSubmit(){

    $("#review_form").on('submit', function(event){
      event.preventDefault();
      updateValues();
      this.submit();  
    });
  }

  function initPageElements(){
    $("ul.bldg-stats.row").tooltip();
    $("li[rel=popover]").popover({placement: 'left'});
  }

  function init(){

    if($("#review_form").length > 0){
      initSlider();
      initFormSubmit();

      initPageElements();
      $("ul.bldg-stats.row").click(function (el){
        document.location.href ='buildings/' + $(this).attr("data-bldg-id");
      });

    }
  }

  return {
    init: init
  }


}());


$(function() { 

  HomeRefs.Reviewer.init();
});

