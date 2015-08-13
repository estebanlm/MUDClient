utils
storeIconMethodFor: each
	| selector source |
	
	selector := (each asFileReference base, 'Icon') asSymbol.
	source := '{1}
	"Method generated"
	^ icons 
		at: #{1}
		ifAbsentPut: [ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self {1}Contents readStream) ]' format: {selector}.
	
	self class 
		compile: source 
		classified: 'accessing icons'