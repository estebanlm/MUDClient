accessing icons
aliasIcon
	"Method generated"
	^ icons 
		at: #aliasIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self aliasIconContents readStream) ]