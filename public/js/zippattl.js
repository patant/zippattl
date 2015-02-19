function deleteFile (filename) {
	$.post( "deletefile", { file: filename } );
	location.reload();
}

function playFile (filename) {
	$.post( "playmp3?volume=10&file=" + filename);
}


