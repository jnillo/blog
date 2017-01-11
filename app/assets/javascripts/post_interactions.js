$('.social-button').click(function(){
	$.ajax({
    url: '/post/social-stats?ref='+$('body').data('post')+'&source='+$(this).data('info'),
    dataType: 'json',
    type: "POST",
    cache: false,
    complete: function(response, status) {
    	//
    }.bind(this),
  });
});

$('#single-post').find('.likes').click(function(){
  add_new_like();
});

$('#blog').find('.likes').click(function(){
  add_new_like();
});

function add_new_like(){
  if($('li.likes > i').hasClass('fa-heart-o')) {
    $.ajax({
      url: '/post/likes?ref='+$('body').data('post'),
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
}

$('.post-link').click(function(element){ 
  $(location).attr('href',$(this).attr('data-ref'));
});