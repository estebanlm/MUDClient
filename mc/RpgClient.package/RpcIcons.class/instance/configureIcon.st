accessing icons
configureIcon
	^ icons
	at: #'configureIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self configureIconContents readStream) ].