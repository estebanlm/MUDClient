accessing icons
acceptIcon
	"Method generated"
	^ icons 
		at: #acceptIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self acceptIconContents readStream) ]