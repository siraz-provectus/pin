var VerifyUrl = window.VerifyUrl = {

  validation: function () {
	$( '#surl' ).on( 'keyup', function () { 
	  var reg = /(\w+):\/\/([^/:]+)(:\d*)?([^# ]*)/;
    var url = $(this).val();
    var submit_button = $(this).parents('form').find('input[type="submit"]');

    if (reg.test(url)) {
        submit_button.removeClass('hidden');
	  } else {
        submit_button.addClass('hidden');
	  }
	});
  }
};