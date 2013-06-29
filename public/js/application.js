$(document).ready(function() {
  
  $('.submit-guess').on('submit', function(e){
      e.preventDefault();
      // e.stopPropagation();

      $.ajax({
        url: '/guess',
        type: 'post',
        data: $(this).serialize()
      }).done(function(response){
        if (response) { $('.answer').html('Correct!')}
        else { $('.answer').attr('display', 'show')};
      });
  });
});
