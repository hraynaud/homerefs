$(function() {
  $("#buildings_search input").keyup(function() {
    $.get($("#buildings_search").attr("action"), $("#buildings_search").serialize(), null, "script");
    return false;
  });
});

