var CookiesHandler = function(){
  this.startObserverMessage();
}

CookiesHandler.prototype.startObserverMessage = function(){
  var handler = this;
  $('#cookies-alert').show();

  $('#cookies-alertButton').click(function(){
    handler.createCookie();
    $('#cookies-alert').fadeOut();
  });

  $('#accept-cookies-btn').click(function(){
    handler.createCookie();
    $('#cookies-alert').hide();
  });
}

CookiesHandler.prototype.createCookie = function(){
  var date = new Date(new Date().setYear(new Date().getFullYear() + 1));
  document.cookie = 'viewed_cookie_policy=true; expires='+date;
}