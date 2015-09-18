accessing icons
filterIcon
	"Method generated"
	^ icons 
		at: #filterIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterIconContents readStream) ]