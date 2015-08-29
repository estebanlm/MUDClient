accessing icons
unknownIcon
	"Method generated"
	^ icons 
		at: #unknownIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self unknownIconContents readStream) ]