const downloadResource = function(event) {
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
        var likes = parseInt($(this).find('button').text()) + 1;
        $(this).find('i').removeClass('fa-heart-o');
        $(this).find('i').addClass('fa-heart');
        $(this).find('button').html(likes);
      }.bind(this),
    });
  }
});