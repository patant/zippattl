function deleteFile (filename) {
	$.post( "deletefile", { file: filename } );
	location.reload();
}

function playFile (filename) {
	$.post( "playmp3?volume=10&file=" + filename);
}

$(".volume").change(function(){
	$value = $(this).val()
	$urls = $(".zippaurl")
	$.each($urls, function(i,v){
		$newUrl = $(v).html().replace(/(.*volume=)(\d{2,3})(.*)/, "$1" + $value + "$3") 
		$(v).html($newUrl)
	})
});
