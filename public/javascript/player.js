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

	$("input[name*='play']").hover(function () {
		$.get( "ajax/test.html", function( data ) {
  $( ".result" ).html( data );
  alert( "Load was performed." );
});	
	});
	

});
 