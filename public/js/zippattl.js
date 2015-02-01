function deleteFile (filename) {
	console.log(filename);
	$.post( "deletefile", { file: filename } );
	location.reload();
}

