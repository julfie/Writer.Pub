$(document).ready(function(){
	$(".queue-search").keyup(function(){
		var query = $(".queue-search").val();
		$('.participant-row').hide();
		$('.participant-row:contains('+query+')').show();
	});
});