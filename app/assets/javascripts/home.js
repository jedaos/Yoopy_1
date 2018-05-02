// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function() {
  console.log("MOBILE READY");
  let signup = $("#signup-mobile");
  signup.click(function(e) {
    e.preventDefault();
    console.log("click");
    window.location.hash = "#icons";
  });
});
