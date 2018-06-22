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
  $(document).ready(function(){
    $(".new_job_form").on("submit", "#submit_job", function(){
      $("#modal_hospital").removeClass("activated").addClass("not-activated");
    })
  })
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
  // New FriendJob Form
  function openFriendJob(){
    if($("#modal_friend").hasClass("not-open")){
      $('#modal_friend').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_back").css("display", "block")
     $("#modal_friend").addClass("is-open")
    }
  }
  function closeFriendJob(){
    if ($("#modal_friend").hasClass("is-open")){
       $('#modal_friend').removeClass("is-open").addClass("not-open");
    }
  }   


  //Edit Job form
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
  $(document).on("turbolinks:load", function(){
    $("#modal_friend").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($("#modal_friend").hasClass("not-open")){
        $(".modal_back").css("display", "none");
      }
    });
  })
  //Prof Show Modal - FRIENDS
  function openProfModal(){
    if($(".modal_content_friend").hasClass("not-open")){
      $('.modal_content_friend').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_prof_back").css("display", "flex")
     $(".modal_content_friend").addClass("is-open")
    }
  }
  function closeProfModal(){
    if ($(".modal_content_friend").hasClass("is-open")){
       $('.modal_content_friend').removeClass("is-open").addClass("not-open");
    }
  }
  $(document).on("turbolinks:load", function(){
    $(".modal_content_friend").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($(".modal_content_friend").hasClass("not-open")){
        $(".modal_prof_back").css("display", "none");
      }
    });
  })
  //Edit friendJob Form
  function openFriendJobEdit(){
    if($(".modal_edit_job").hasClass("not-open")){
      $('.modal_edit_job').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_edit_back").css("display", "flex")
     $(".modal_edit_job").addClass("is-open")
    }
  }
  function friendJobEditClose(){
    if ($(".modal_edit_job").hasClass("is-open")){
       $('.modal_edit_job').removeClass("is-open").addClass("not-open");
    }
  }
  $(document).on("turbolinks:load", function(){
    $(".modal_edit_job").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($(".modal_edit_job").hasClass("not-open")){
        $(".modal_edit_back").css("display", "none");
      }
    });
  })

  // Prof Modal Show - HOSPITAL
  function openProfModalHospital(){
    if($(".modal_content_hospital").hasClass("not-open")){
      $('.modal_content_hospital').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_prof_back_3").css("display", "flex")
     $(".modal_content_hospital").addClass("is-open")
    }
  }
  function closeProfModalHospital(){
    if ($(".modal_content_hospital").hasClass("is-open")){
       $('.modal_content_hospital').removeClass("is-open").addClass("not-open");
    }
  }
  $(document).on("turbolinks:load", function(){
    $(".modal_content_hospital").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($(".modal_content_hospital").hasClass("not-open")){
        $(".modal_prof_back_3").css("display", "none");
      }
    });
  })
//Prof dashboard edit account ifo
  function openEditAccountModal(){
    if($("#account_info").hasClass("not-open")){
      $('#account_info').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_prof_back_1").css("display", "flex")
     $("#account_info").addClass("is-open")
    }
  }
  function closeEditProfModal(){
    if ($("#account_info").hasClass("is-open")){
       $('#account_info').removeClass("is-open").addClass("not-open");
    }
  }
  $(document).on("turbolinks:load", function(){
    $("#account_info").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($("#account_info").hasClass("not-open")){
        $(".modal_prof_back_1").css("display", "none");
      }
    });
  })
  //Prof show hospital info
  function openHospitaltModal(){
    if($("#hospital_account_info").hasClass("not-open")){
      $('#hospital_account_info').removeClass("not-open").addClass("is-open")
    } else {
      $(".modal_prof_back_2").css("display", "flex")
     $("#hospital_account_info").addClass("is-open")
    }
  }
  function closeHospitalModal(){
    if ($("#hospital_account_info").hasClass("is-open")){
       $('#hospital_account_info').removeClass("is-open").addClass("not-open");
    }
  }
  $(document).on("turbolinks:load", function(){
    $("#hospital_account_info").bind("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function(){
    if ($("#hospital_account_info").hasClass("not-open")){
        $(".modal_prof_back_2").css("display", "none");
      }
    });
  })

//   // Sending Text after friendJob created
function text(){
  let form = $(".new_job_form");
  let radius = Number($("input[name='miles']:checked").val());
  let id = $(".friend_id").val();
  let amount = $(".friendJob_rate").val();
  form.submit(function(){
    $.ajax({
      url: "notifications/notify_text",
      method: "POST",
      data: { radius: radius, id: id, amount: amount },
      success: (res) => {
        console.log("success");
      },
      error: (err) => {
        console.log(err);
      }
    });
  });
}
