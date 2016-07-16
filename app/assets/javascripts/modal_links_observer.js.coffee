@contentLinkObserver =
  load_content_modal: (link_ref, content_ref) ->
    $.ajax
      url: '/home/load_info',
      dataType: 'json',
      type: "POST",
      cache: false,
      data: { content: content_ref },
      complete: (response, status) ->
        $('#main-modal').find('.modal-content').html(response.responseJSON.content)