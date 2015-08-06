accessing icons
connectIcon
	^ icons
	at: #'connectIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self connectIconContents readStream) ].