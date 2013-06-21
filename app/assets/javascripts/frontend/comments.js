var CommentsManagement = window.CommentsManagement = {

  destroy: function () {
    $(document).on("click", '.comment_destroy_style', function() {
      $(this).parents('.comment').remove();
      $('#pins_contein').masonry('reload');
    });  	
  },

  validation: function () {
	$( '.new_comment textarea' ).on( 'keyup', function () { 
	  var form_text_length = $(this).val().length;
      var submit_button = $(this).parents('form').find('input[type="submit"]');

	  if ( form_text_length > 0 ) {
        submit_button.removeClass('hidden');
	  } else {
        submit_button.addClass('hidden');
	  }
    $('#pins_contein').masonry('reload');
	});
  },

  initialize: function () {
    CommentsManagement.destroy();
    CommentsManagement.validation();
  }
};
