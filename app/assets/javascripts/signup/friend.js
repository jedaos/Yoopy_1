$(document).on("turbolinks:load", function() {
  let form = $("#friend-form");
  let button = $("#friend_submit");

  form.submit(function() {
    $(this).fadeOut();
  });
});
