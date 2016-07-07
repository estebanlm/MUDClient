accessing icons
filterTriggerIcon
	"Method generated"
	^ icons 
		at: #filterTriggerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self filterTriggerIconContents readStream) ]