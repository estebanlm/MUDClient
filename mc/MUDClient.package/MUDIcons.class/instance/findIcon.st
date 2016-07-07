accessing icons
findIcon
	"Method generated"
	^ icons 
		at: #findIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self findIconContents readStream) ]