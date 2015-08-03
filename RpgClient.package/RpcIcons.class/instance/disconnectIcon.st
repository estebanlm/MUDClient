accessing icons
disconnectIcon
	^ icons
	at: #'disconnectIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self disconnectIconContents readStream) ].