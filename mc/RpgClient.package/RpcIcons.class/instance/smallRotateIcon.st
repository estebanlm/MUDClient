accessing icons
smallRotateIcon
	^ icons
	at: #'smallRotateIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallRotateIconContents readStream) ].