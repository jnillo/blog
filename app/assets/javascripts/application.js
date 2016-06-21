// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require admin/posts
//= require admin/clean_form
//= require handlebars.runtime
<<<<<<< 6b3f0579769d5058b0c6691e52857e030e981a50
//= require cookies
=======
//= require social-share-button
>>>>>>> update create post and seo

var getBroserTypeMobile = function(type) {
  return document.cookie.indexOf(type) > 0
}

var hideHomeNavbar = function (){
  if($('.home-navbar')!==null){
  	$('.home-navbar').hide();
  }
}

var showHomeNavbar = function (){
  if($('.home-navbar')!==null){
  	$('.home-navbar').show();
  }
}
var detectMobile = function() {
   if(window.innerWidth <= 600) {
     return true;
   } else {
     return false;
   }
}

var checkWindowSize = function(){
  if (detectMobile()){
  	if(!getBroserTypeMobile('mobile')) {
  	  createCookieWindowSize('mobile');
      top.location.href = "http://m.blog.dev";
    }
  } else {
    if(!getBroserTypeMobile('web')) {
  	  createCookieWindowSize('web');
      top.location.href = "http://blog.dev";
    }
  }
}

var createCookieWindowSize = function(browser_type){
  var date = new Date(new Date().setYear(new Date().getFullYear() + 1));
  document.cookie = 'browser=' + browser_type + '; expires='+date;
}

$(document).ready(function(){
    $(function () {
    	hideHomeNavbar();
		$(window).scroll(function () {
            // set distance user needs to scroll before we fadeIn navbar
			if ($(this).scrollTop() > 40) {
				$('.navbar').removeClass('navbar-static-top');
			    $('.navbar').addClass('navbar-fixed-top');
			    showHomeNavbar();
			} else {
				$('.navbar').addClass('navbar-static-top');
				$('.navbar').removeClass('navbar-fixed-top');
				hideHomeNavbar();
			}
		});
	});
    
    checkWindowSize();
    $(window).resize(function(){
      checkWindowSize();
    })
});