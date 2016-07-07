accessing icons
cancelIcon
	"Method generated"
	^ icons 
		at: #cancelIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self cancelIconContents readStream) ]