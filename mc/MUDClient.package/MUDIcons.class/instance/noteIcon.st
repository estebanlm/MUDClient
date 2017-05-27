accessing icons
noteIcon
	"Method generated"
	^ icons 
		at: #noteIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self noteIconContents readStream) ]