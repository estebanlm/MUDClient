accessing icons
disconnectIcon
	"Method generated"
	^ icons 
		at: #disconnectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self disconnectIconContents readStream) ]