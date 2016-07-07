accessing icons
filterRedirectIcon
	"Method generated"
	^ icons 
		at: #filterRedirectIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterRedirectIconContents readStream) ]