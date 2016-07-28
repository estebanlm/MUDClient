accessing icons
map1Icon
	"Method generated"
	^ icons 
		at: #map1Icon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self map1IconContents readStream) ]