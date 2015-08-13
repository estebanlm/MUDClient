accessing icons
reconnectIcon
	"Method generated"
	^ icons 
		at: #reconnectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self reconnectIconContents readStream) ]