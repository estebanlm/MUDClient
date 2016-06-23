accessing
applyStyle: aString
	aString linesDo: [ :each |
		text endPosition insert: each, (String cr) ]