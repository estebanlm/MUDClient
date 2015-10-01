accessing
send: aString toFilter: aFilter
	| filterMorph |
	
	aFilter isAlert ifTrue: [ 
		self alert 
			alertTitle: aFilter name 
			contents: aString 
			color: aFilter alertColor.
		^ self ].
	
	filterMorph := self areaAt: aFilter ifAbsent: [ nil ].
	filterMorph ifNil: [ ^ self ].
	filterMorph model appendParsedText: (aString, String lf).
	filterMorph adjustScrollbars.
	(self activeFilter ~= aFilter) ifTrue: [ 
		self dirtyAt: aFilter put: true.
		self announcer announce: MUDFilterUpdated new ]