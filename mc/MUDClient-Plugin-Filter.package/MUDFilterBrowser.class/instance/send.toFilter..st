accessing
send: aString toFilter: aFilter
	| filterMorph |
	
	filterMorph := self areasAt: aFilter ifAbsent: [ nil ].
	filterMorph ifNil: [ ^ self ].
	filterMorph model appendParsedText: (aString, String lf).
	filterMorph adjustScrollbars.
	self activeFilter = aFilter ifFalse: [ 
		self dirtiesAt: aFilter put: true.
		self announcer announce: MUDFilterUpdated new ]