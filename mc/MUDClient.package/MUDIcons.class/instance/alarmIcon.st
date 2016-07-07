accessing icons
alarmIcon
	"Method generated"
	^ icons 
		at: #alarmIcon
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self alarmIconContents readStream) ]