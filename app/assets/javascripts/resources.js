const resourceDownload = function(event) {
  $.ajax({
      url: '/resources/download/' + event.target.dataset.ref,
      dataType: 'json',
      cache: false
    });
}

$('#resources').find('.likes').click(function(){
  if($('li.likes > i').hasClass('fa-heart-o')) {
    $.ajax({
      url: '/resources/likes?ref=' + this.dataset.ref,
      dataType: 'json',
      type: "POST",
      cache: false,
      complete: function(response, status) {
        var likes = parseInt($('li.likes > button').text()) + 1;
        $('li.likes > i').removeClass('fa-heart-o');
        $('li.likes > i').addClass('fa-heart');
        $('li.likes > button').html(likes);
      }.bind(this),
    });
  }
});