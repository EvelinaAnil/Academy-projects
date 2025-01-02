$(".menu li a").click(function () {
  $(".menu li a.active").removeClass("active");

  $(this).toggleClass("active");
});

$(".accordion-header").click(function () {
  $(".accordion-header.active")
    .removeClass("active")
    .next()
    .removeClass("active");

  $(this).toggleClass("active");

  $(this).next().toggleClass("active");
});


