accessing icons
flagBlueIcon
	"Method generated"
	^ icons 
		at: #flagBlueIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self flagBlueIconContents readStream) ]