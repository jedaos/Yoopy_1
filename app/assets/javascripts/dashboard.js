// // # Place all the behaviors and hooks related to the matching controller here.
// // # All this logic will automatically be available in application.js.
// // # You can use CoffeeScript in this file: http://coffeescript.org/
// $(document).ready(function(){
//   $('#customButton').click(function(){
//     console.log("Click");
//   })
// })
$(document).ready(function(){
  $('#stripe_dash').click(function(){
    window.open($('#stripe_account').text(), "_blank")
  })
})
