$(document).on("turbolinks:load", function() {
  let form = $("#friend-form");
  form.submit(function() {
    form.animate({
      height: "0px"
    });
  });
});
