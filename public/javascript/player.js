$( document ).ready(function() {  	
/*	
	$("#add").click(function () {
		if($("#inputBox").val() != ""){
			setNumbersToArray( $("#inputBox").val() );	
			$("#inputBox").val("");
			$("#inputBox").blur();
			
			$("#boxes").append("<li> <span>" + array[array.length - 1] + "</span> </li>");
		}
	
		if( array.length == numbersCount ){
			endOfPushing = true;
		}
	});
*/

	$("input[name*='play']").click(function () {
		$.post( "pause" );
	});
	
	$("input[name*='stop']").click(function () {
		$.post( "/stop" );
	});
	
	$("input[name*='next']").click(function () {
		$.post( "/next" );
	});
	
	$("input[name*='prev']").click(function () {
		$.post( "/prev" );
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
 