accessing icons
trashIcon
	"Method generated"
	^ icons 
		at: #trashIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self trashIconContents readStream) ]