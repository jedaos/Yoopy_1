$(document).on("turbolinks:load", function() {
  let headline = $("#signup-headline");
  headline.click(function() {
    $(this).animate(
      {
        height: "+=100"
      },
      2000,
      "easeOutBack"
    );
  });
});
