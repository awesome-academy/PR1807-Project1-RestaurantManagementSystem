$(document).ready(function () {
  /*[ Show/hide sidebar ]
  ===========================================================*/
  $('body').append('<div class="overlay-sidebar trans-0-4"></div>');
  var ovlSideBar = $('.overlay-sidebar');
  var btnShowSidebar = $('.btn-show-sidebar');
  // var btnHideSidebar = $('.btn-hide-sidebar');
  var sidebar = $('.sidebar');
  
  $(btnShowSidebar).on('click', function(){
    console.log("show sidebar");
    $(sidebar).addClass('show-sidebar');
    $(ovlSideBar).addClass('show-overlay-sidebar');
  })
  
  $(btnHideSidebar).on('click', function(){
    console.log("hide sidebar");
    $(sidebar).removeClass('show-sidebar');
    $(ovlSideBar).removeClass('show-overlay-sidebar');
  })
  
  $(ovlSideBar).on('click', function(){
    console.log("hide sidebar");
    $(sidebar).removeClass('show-sidebar');
    $(ovlSideBar).removeClass('show-overlay-sidebar');
  })
});