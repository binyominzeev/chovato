$( function() {
	$( ".draggable" ).draggable({ revert: true });
	$( ".droppable" ).droppable({
		drop: function( event, ui ) {
			var tag=after_underscore($(ui.draggable).attr('id'));
			var ticket=after_underscore($(this).attr('id'));
			
			$.get("add_tag.php?ticket="+ticket+"&tag="+tag, function( data ) {
				$("#ticket_"+ticket).html(data);
			});
		}
	});
	
	$(".reply_link").click(function() {
		var thid=$(this).attr("id");
		$("#reply_to").val(thid);
		$("#reply_to_show").text(thid);
		return false;
	});
});

function after_underscore(str) {
	var index = str.lastIndexOf("_");
	var result = str.substr(index+1);
	
	return result;
}
