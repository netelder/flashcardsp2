$(document).ready(function() {
  
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
