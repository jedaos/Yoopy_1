// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
//Hospital Dashboard - Send text message
function text() {
    let form = $("#new_job_form");
    form.submit(function(){
      console.log("submitted");
      $.ajax({
        url: "notifications/notify_text",
        method: "POST",
        success: (res) => {
          console.log("Success, message sent", res);
        },
        error: (err) => {
          console.log(err);
        }
      })
    })
  }
