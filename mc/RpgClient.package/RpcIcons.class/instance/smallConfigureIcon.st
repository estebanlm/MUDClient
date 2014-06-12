accessing icons
smallConfigureIcon
	^ icons
	at: #'smallConfigureIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallConfigureIconContents readStream) ].