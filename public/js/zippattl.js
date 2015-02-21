function deleteFile (filename) {
	$.post( "deletefile", { file: filename } );
	location.reload();
}

function playFile (buttonEl) {
	url = $(buttonEl).closest('td').prev('td').text()
	console.log(url)
	$.post(url);
}

$(".volume").change(function(){
	$value = $(this).val()
	$urls = $(".zippaurl")
	$.each($urls, function(i,v){
		$newUrl = $(v).html().replace(/(.*volume=)(\d{2,3})(.*)/, "$1" + $value + "$3") 
		$(v).html($newUrl)
	})
});

$(".player").change(function(){
	$value = $(this).val().replace(/uuid:/, "")
	$urls = $(".zippaurl")
	console.log($value)
	$.each($urls, function(i,v){
		console.log(v);

		$newUrl = $(v).html().replace(/(.*player=)(.*)/, "$1" + $value) 
		$(v).html($newUrl)
	})
})
