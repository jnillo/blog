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
//= require cookies
//= require social-share-button
//= require modal_links_observer
//= require resources

var getBroserTypeMobile = function(type) {
  return document.cookie.indexOf(type) > 0
}

var detectMobile = function() {
   if(window.innerWidth <= 600) {
     return true;
   } else {
     return false;
   }
}

var openSideMenu = function() {
  if(window.innerWidth <= 600) {
    $('body').addClass('open-sidenav');
    $('#side-navbar').click(function(){
      $('body').removeClass('open-sidenav');
    });
  }
}

var checkWindowSize = function(){
  if (detectMobile()){
  	if(!getBroserTypeMobile('mobile')) {
  	  createCookieWindowSize('mobile');
      top.location.href = "http://m.blog.dev" + document.location.pathname;
    }
  } else {
    if(!getBroserTypeMobile('web')) {
  	  createCookieWindowSize('web');
      top.location.href = "http://blog.dev" + document.location.pathname;
    }
  }
}

var createCookieWindowSize = function(browser_type){
  var date = new Date(new Date().setYear(new Date().getFullYear() + 1));
  document.cookie = 'browser=' + browser_type + '; expires='+date;
}

$(document).ready(function(){
    contentLinkObserver.load_content_modal('cookies-policy-link', 'layouts/shared/cookies_policy');
    checkWindowSize();
    $(window).resize(function(){
      checkWindowSize();
    })
});