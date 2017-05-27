accessing icons
markerIcon
	"Method generated"
	^ icons 
		at: #markerIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self markerIconContents readStream) ]