accessing icons
openIcon
	"Method generated"
	^ icons 
		at: #openIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self openIconContents readStream) ]