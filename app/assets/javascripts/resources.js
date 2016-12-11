const resourceDownload = function(event) {
  $.ajax({
      url: '/resources/download/' + event.target.dataset.ref,
      dataType: 'json',
      cache: false
    });
}