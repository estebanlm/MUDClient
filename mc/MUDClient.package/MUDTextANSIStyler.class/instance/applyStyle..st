accessing
applyStyle: aString
	| formatter |
	formatter := self createFormatter.
	aString linesDo: [ :each |
		each ifNotEmpty: [  
			formatter visitAll: (parser 
				parse: each 
				onError: [ :message | self error: message ]) ].
		text endPosition insert: String cr ]