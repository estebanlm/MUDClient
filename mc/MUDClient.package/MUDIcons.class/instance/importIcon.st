accessing icons
importIcon
	"Method generated"
	^ icons 
		at: #importIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self importIconContents readStream) ]