accessing
cleanText: aString
	^ self visitAll: (MUDANSIParser default
		parse: aString 
		onError: [ ^ aString ])