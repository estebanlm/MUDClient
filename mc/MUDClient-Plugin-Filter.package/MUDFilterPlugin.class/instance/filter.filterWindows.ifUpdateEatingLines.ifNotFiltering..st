private
filter: aString filterWindows: windows ifUpdateEatingLines: eatLinesBlock ifNotFiltering: aBlock
	| matchingPattern filter |
	
	matchingPattern := self filterPatternForLine: aString.
	"no match"
	matchingPattern ifNil: [ aBlock value. ^ nil ].

	filter := matchingPattern filter.
	filter send: aString toWindows: (windows select: [ :each | each filter = filter]).
	filter isAlert 
		ifTrue: [ aBlock value ]
		ifFalse: [ eatLinesBlock value: (matchingPattern eatLines ifNil: [0]) ].
	
	^ filter