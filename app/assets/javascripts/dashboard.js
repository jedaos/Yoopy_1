// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/

//Prof Dashboard
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
  //Hospital Side Nav
  function openNavHospital(){
    let sidebar = $(".sidebar-hospital");
    sidebar.animate({
      width: "200px"
    }, 500)
    $("h6").delay(500).animate({"opacity" : "1"}, 500)
    $(".close").animate({"opacity": "1"}, 500)
  }
  function closeNavHospital(){
  let sidebar = $(".sidebar-hospital");
    sidebar.animate({
      width: "60px"
    }, 500)
    $("h6").animate({"opacity" : "0"}, 200)
    $(".close").animate({"opacity": "0"}, 500)
  }
  //New Job
  function formOpen() {
    if($("#modal_hospital").hasClass("not-activated")){
      $('#modal_hospital').removeClass("not-activated").addClass("activated")
    } else {
      $(".modal_back").css("display", "block")
     $("#modal_hospital").addClass("activated")
    }
  }

  function formClose(){
    if ($("#modal_hospital").hasClass("activated")){
       $('#modal_hospital').removeClass("activated").addClass("not-activated");
    }
  }
  //Edit form
  $(document).ready(function(){
    $(".edit-job").on('click', '.close-edit', function(){
      $("#edit-job-form").toggle("slideUp")
    })
  })

  $(document).on("turbolinks:load", function(){
    $("#modal_hospital").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($("#modal_hospital").hasClass("not-activated")){
        $(".modal_back").css("display", "none");
      }
    });
  })
