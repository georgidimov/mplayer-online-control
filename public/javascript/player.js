$( document ).ready(function() {  	
	$("input[name*='play']").click(function () {
		$.post( "pause" );
	});
	
	$("input[name*='stop']").click(function () {
		$.post( "/stop" );
	});
	
	$("input[name*='volume_up']").click(function () {
		$.post( "/volume_up" );
	});
	
	$("input[name*='volume_down']").click(function () {
		$.post( "/volume_down" );
	});
		
	$("#songlist li").click(function () {
				$.ajax({
		url: '/play',
		type: 'POST',
		dataType: 'json',
		contentType: "application/json",
		data: JSON.stringify({name: $(this).text()}),
		success: function(data){
		}
		})
	})
});
 