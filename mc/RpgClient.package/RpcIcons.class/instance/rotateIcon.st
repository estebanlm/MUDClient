accessing icons
rotateIcon
	"Method generated"
	^ icons 
		at: #rotateIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self rotateIconContents readStream) ]