accessing icons
logViewerIcon
	"Method generated"
	^ icons 
		at: #logViewerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self logViewerIconContents readStream) ]