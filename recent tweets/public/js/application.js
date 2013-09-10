$(document).ready(function() {

  $('form').on('submit', function(e){
    e.preventDefault();
    $('p').append("<img src='beachball.gif' id='beachball'>")
    $.ajax({
      url: this.action,
      type: this.method,
      data: $(this).serialize()
    }).done(function(server_data){
      $('#beachball').remove();
      $('#ten_tweets').remove();
      $('form').append(server_data)
    }).fail(function(server_data){
      console.log("fail")
    })
  })
});
