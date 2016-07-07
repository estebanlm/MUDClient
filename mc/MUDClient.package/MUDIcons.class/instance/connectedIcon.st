accessing icons
connectedIcon
	"Method generated"
	^ icons 
		at: #connectedIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self connectedIconContents readStream) ]