accessing icons
notepadIcon
	"Method generated"
	^ icons 
		at: #notepadIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self notepadIconContents readStream) ]