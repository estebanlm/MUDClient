accessing
cleanText: aString
	^ (self default 
			parse: aString 
			onError: [ ^ aString ])
		inject: ''
		into: [ :s :each | s, each text ]