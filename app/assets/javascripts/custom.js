$(document).ready(function () {
  /*[ Show/hide sidebar ]
  ===========================================================*/
  $('body').append('<div class="overlay-sidebar trans-0-4"></div>');
  var ovlSideBar = $('.overlay-sidebar');
  var btnShowSidebar = $('.btn-show-sidebar');
  var sidebar = $('.sidebar');

  $(btnShowSidebar).on('click', function(){
    console.log('show sidebar');
    $(sidebar).addClass('show-sidebar');
    $(ovlSideBar).addClass('show-overlay-sidebar');
  });

  $(ovlSideBar).on('click', function(){
    console.log('hide sidebar');
    $(sidebar).removeClass('show-sidebar');
    $(ovlSideBar).removeClass('show-overlay-sidebar');
  });

  var select_image = document.getElementById('select-img');
  var image_preview = document.getElementById('img-preview');
  if(select_image){
    if(select_image.files[0] != ''){
      image_preview.style.visibility = 'visible';
    }
    select_image.addEventListener('change', function(){
      image_preview.style.visibility = 'visible';
      var tmppath = URL.createObjectURL(select_image.files[0]);
      image_preview.setAttribute('src', tmppath);
    });
  }
});

function dish_quantity_sub(){
  var quantity = document.getElementById('search-quantity');
  if(quantity.innerHTML == '0') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) - 1;
  // $('#search-quantity').innerHTML = parseInt($('#search-quantity').innerHTML) + 1;
}

function dish_quantity_add(){
  var quantity = document.getElementById('search-quantity');
  if(quantity.innerHTML == '1000') return;
  quantity.innerHTML = parseInt(quantity.innerHTML) + 1;
  // $('#search-quantity').innerHTML = parseInt($('#search-quantity').innerHTML) + 1;
}
(function($) {
  // Menu filer
  $('#menu-flters li a').click(function() {
    $('#menu-flters li a').removeClass('active');
    $(this).addClass('active');

    var selectedFilter = $(this).data('filter');
    //  $('#menu-wrapper').fadeTo(100, 0);

    $('.menu-restaurant').fadeOut();

    setTimeout(function() {
      $(selectedFilter).slideDown();
      //$('#menu-wrapper').fadeTo(300, 1);
    }, 300);
  });

  // Add smooth scrolling to all links in navbar + footer link
  $('.sidenav a').on('click', function(event) {
    var hash = this.hash;
    if (hash) {
      event.preventDefault();
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function() {
        window.location.hash = hash;
      });
    }

  });

  $('.sidenav a').on('click', function() {
    closeNav();
  });

})(jQuery);
