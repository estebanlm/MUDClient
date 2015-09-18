accessing
cleanText: aString 
	^ MUDANSITextCleaner visitAll: (self ansiParser 
		parse: aString 
		onError: [ ^aString ])