accessing icons
tagIcon
	"Method generated"
	^ icons 
		at: #tagIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self tagIconContents readStream) ]