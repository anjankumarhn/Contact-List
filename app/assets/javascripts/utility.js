$(function() {
	$(".close").click(function(){
		$(".msg").hide();});
	setInterval(function(){
		$('.msg').slideUp();
	}, 5000);
	

});
