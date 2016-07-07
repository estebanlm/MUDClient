accessing icons
filterAlertIcon
	"Method generated"
	^ icons 
		at: #filterAlertIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterAlertIconContents readStream) ]