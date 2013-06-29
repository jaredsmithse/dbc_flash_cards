$(document).ready(function() {

  $('form.submit-guess').on('submit', function(e){
      e.preventDefault();

      $.ajax({
        url: '/guess',
        type: 'post',
        data: $(this).serialize()
      }).done(function(response){
        console.log(response);
        if (response === 'true') { $('.answer').html('Correct!').css('display', 'block');}
        else { $('.answer').css('display', 'block'); }
      });
  });
});

