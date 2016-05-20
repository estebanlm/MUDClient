accessing
text: aString
	| parsedText |
	parsedText := self parseText: aString.
	self mutex critical: [ 
		super text: parsedText ]