function add_new_like(like_block){
  if($(like_block).find('i').hasClass('fa-heart-o')) {
    $.ajax({
      url: '/post/likes?ref='+$('body').data('post'),
      dataType: 'json',
      type: "POST",
      cache: false,
      complete: function(response, status) {
        var likes = parseInt($(like_block).find('button').text()) + 1;
        $(like_block).find('i').removeClass('fa-heart-o');
        $(like_block).find('i').addClass('fa-heart');
        $(like_block).find('button').html(likes);
      }.bind(this),
    });
  }
}
$( document ).ready(function() {
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
    add_new_like(this);
  });

  $('#blog').find('.likes').click(function(){
    add_new_like(this);
  });

  $('.post-link').click(function(element){
    $(location).attr('href',$(this).attr('data-ref'));
  });
});