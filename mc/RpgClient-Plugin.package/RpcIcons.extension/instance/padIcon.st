*RpgClient-Plugin
padIcon 
	^ icons
	at: #'padIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self padIconContents readStream) ].