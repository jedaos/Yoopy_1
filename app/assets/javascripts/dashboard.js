// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/




  function openNav(){
    let sidebar = $(".sidebar-items");
    sidebar.animate({
      width: "200px"
    }, 500)
    $("h6").delay(500).animate({"opacity" : "1"}, 500)
    $(".close").animate({"opacity": "1"}, 500)
  }
  function closeNav(){
  let sidebar = $(".sidebar-items");
    sidebar.animate({
      width: "60px"
    }, 500)
    $("h6").animate({"opacity" : "0"}, 200)
    $(".close").animate({"opacity": "0"}, 500)
    }
