accessing icons
connectIcon
	"Method generated"
	^ icons 
		at: #connectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self connectIconContents readStream) ]