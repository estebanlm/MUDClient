accessing icons
disconnectedIcon
	"Method generated"
	^ icons 
		at: #disconnectedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self disconnectedIconContents readStream) ]