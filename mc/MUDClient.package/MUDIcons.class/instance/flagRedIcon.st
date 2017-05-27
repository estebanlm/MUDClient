accessing icons
flagRedIcon
	"Method generated"
	^ icons 
		at: #flagRedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self flagRedIconContents readStream) ]