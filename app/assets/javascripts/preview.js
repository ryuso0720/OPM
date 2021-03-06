$(function() {
  $('#preview').on('click', function() {
    var text = $('#md-textarea').val();
    if (text == "") {
      return;
    }
    $.ajax({  
      url: '/api/articles/preview',
      type: 'GET',
      dataType: 'json',
      data: { body: text }
    })
    .done(function(html) {
      $('#md-textarea').parent().css('display', 'none');
      $('#preview-area').append(html.body);
      $('#markdown').removeClass('disabled');
      $('#preview').addClass('disabled');
    })
    .fail(function() {
      alert('failed for markdown preview');
    })
  })

  $('#markdown').on('click', function() {
    $('#md-textarea').parent().css('display', '');
    $('#preview-area').empty();
    $('#preview').removeClass('disabled');
    $('#markdown').addClass('disabled');
  })
})