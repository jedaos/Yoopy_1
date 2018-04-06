
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require materialize-sprockets
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).on('ajax:before', function() {
  $('#spinner').slideDown();
  console.log('ajax before');
}).on('ajax:complete', function() {
  console.log('ajax:complete');
  $('#spinner').fadeOut();
})


$( document ).on('turbolinks:load', function(){

  $('.dropdown-trigger').dropdown()

  $(".button-collapse").sideNav();
  $('.modal').modal();
  $('#modal_prof').modal();
  $('.tooltipped').tooltip({delay: 50, tooltip: `Yoopy friends are individuals seeking healthcare <br /> professionals for their loved ones`, html: true});
  $('.tabs').tabs();
  // $('.modal').modal();
  // $('#modal1').modal('open');
  // $('#modal1').modal('close');
  // $('#button_modal').click(function(){
  // $('.modal_hospital').html("<%= j(render 'new_job') %>");

  // $('.new_job_button').hide();


});
