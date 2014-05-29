*RpgClient-Plugin
notepadIcon 
	^ icons
	at: #'notepadIcon'
	ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self notepadIconContents readStream) ].