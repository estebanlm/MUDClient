accessing icons
map2Icon
	"Method generated"
	^ icons 
		at: #map2Icon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self map2IconContents readStream) ]