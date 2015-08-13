accessing icons
configureIcon
	"Method generated"
	^ icons 
		at: #configureIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self configureIconContents readStream) ]