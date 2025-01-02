$('.accordion-header').click(function(){
  $('.accordion-header.active').removeClass('active').next().removeClass('active');
  $(this).addClass('active').next().addClass('active');
});
$('.menu li a').click(function()
{

    $('.menu li a.active').removeClass('active')
    $(this).toggleClass('active');

})


$('#customers-testimonials').owlCarousel({
  loop: true,
  center:true,
  items: 3,
  nav:true,
  responsive:{
      0:{
          items:1
      },
      800:{
          items:3
      }
  }
})

let userPhone = $('#user-phone');
userPhone.mask("(999) 999-99-99");
$('#contact-form').on('submit', function(){
  let userName = $('#user-name'),
   userSubject = $('#user-subject'),
   userEmail = $('#user-email'),
   userMessage = $('#user-message');

  if(userName.val().length<2){
    userName.addClass('invalid');
    return false;
  } else {
    userName.removeClass('invalid');
  }
  if(userEmail.val().length<3){
    userEmail.addClass('invalid');
    return false;
  } else {
    userEmail.removeClass('invalid');
  }
  if(userSubject.val().length<3){
    userSubject.addClass('invalid');
    return false;
  } else {
    userSubject.removeClass('invalid');
  }
  if(userMessage.val().length<8){
    userMessage.addClass('invalid');
    return false;
  } else {
    userMessage.removeClass('invalid');
  }
  $('#thanks-contact h3').text(`Thank you ${userName.val()}!`);
  $('#thanks-contact .content').text(`Your message is  ${userMessage.val()}!`);
  $('#thanks-contact').fadeIn(400);
  return false;
})
$('.popup-close').click(function(){
  $(this).closest('.popup-wrapper').fadeOut(400);
})

$('[href^="#"]').click(function(event){
  event.preventDefault();
  let elem = $(this).prop('hash');
  console.log($(elem).offset(),$(elem).offset().top)
  $('html, body').animate({scrollTop: $(elem).offset().top - 60}, 600)
})

$('.categories a').click(showBooks);
function showBooks(evt){
  evt.preventDefault();
  $('.cat-link.active').removeClass('active');
  $(this).addClass('active');
  let bookDiv = '';
  $.ajax({
    url: $(this).attr('href')+'.json',
    dataType: 'json',
    beforeSend: function(){
      $('.loader').show();
    }
  })
  .done(function(data){
    console.log(data)
    $('.loader').hide();
    $.each(data.works, function(index, bookInfo){
      bookDiv+=`<div class="book">
        <div class="book-cover"><img src="https://covers.openlibrary.org/b/id/${bookInfo.cover_id
      }-M.jpg" alt="${bookInfo.title}" loading="lazy"></div>
        <div class="book-title">${bookInfo.title}</div>
      </div>`;
    })
    console.log(bookDiv)
    $('.books').html(bookDiv);
  })
  .fail(function(){
    console.error('Error')
  })
}
$('.categories a:eq(0)').click();

let sectionMore = $('#see-more'),
	topCoord = $(window).height() - sectionMore.outerHeight();
$(window).on('resize', function () {
	topCoord = $(window).height() - sectionMore.outerHeight();
	if (!sectionMore.hasClass('closed')) {
		sectionMore.css('top', topCoord);
	}
})
$('.close-green, #not-now').click(function () {
	let section = $(this).parents('section');
	let target = $('.close-green');
	if (section.hasClass('closed')) {
		section.animate({
			top: topCoord
		}, 400);
		target.html('&times;');
	} else {
		section.animate({
			top: '97vh'
		}, 400);
		target.html('&#9650;');
	}
	section.toggleClass('closed');
});