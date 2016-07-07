accessing icons
addIcon
	"Method generated"
	^ icons 
		at: #addIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self addIconContents readStream) ]