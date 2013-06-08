$(document).ready(function() {
  
  $('#gamesubmit').on('click', function(e){
     e.preventDefault();
     
     $.ajax({
       url: '/game',
       method: 'post',
       data: $('form').serialize()
     }).done(function(data){
          console.log(data);
          $('#answer').html(data[0]);
          $('#question').html(data[1]);
          $('input[id=card_id]').val(data[2]);
          $('input[name=answer]').val('')
  
       // # this is where we push them to profile page
     }); // closes done

   }); // closes on click

  $('#login_form').on('click', function(e){
     e.preventDefault();
     
     $.ajax({
       url: '/login',
       method: 'post',
       data: $(this).serialize()
     }).done(function(data){
          console.log(data)
          $('#new_user_form').hide();
          $('#profile').html(data);
  
       // # this is where we push them to profile page
     }); // closes done

   }); // closes on click

}); // closes ready
