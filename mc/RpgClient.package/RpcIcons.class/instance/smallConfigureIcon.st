accessing icons
smallConfigureIcon
	"Method generated"
	^ icons 
		at: #smallConfigureIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallConfigureIconContents readStream) ]