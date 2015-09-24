accessing
send: aString toFilter: aFilter
	| filterMorph |
	
	filterMorph := self areaAt: aFilter ifAbsent: [ nil ].
	filterMorph ifNil: [ ^ self ].
	filterMorph model appendParsedText: (aString, String lf).
	filterMorph adjustScrollbars.
	(self activeFilter ~= aFilter) ifTrue: [ 
		self dirtyAt: aFilter put: true.
		self announcer announce: MUDFilterUpdated new ]