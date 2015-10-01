private
filter: aString filterWindows: windows ifUpdateEatingLines: eatLinesBlock ifNotFiltering: aBlock
	| matchingPattern filter |
	
	matchingPattern := self filterPatternForLine: aString.
	"no match"
	matchingPattern ifNil: [ aBlock value. ^ nil ].

	filter := matchingPattern filter.	
	windows do: [ :w | w send: aString toFilter: filter ].
	filter isAlert 
		ifTrue: [ aBlock value ]
		ifFalse: [ eatLinesBlock value: (matchingPattern eatLines ifNil: [0]) ].
	
	^ filter