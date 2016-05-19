private
filter: aString in: aTerminal ifUpdateEatingLines: eatLinesBlock ifNotFiltering: aBlock
	| matchingPattern filter windows |
	
	matchingPattern := self filterPatternForLine: aString.
	matchingPattern ifNil: [ aBlock value. ^ nil ].

	filter := matchingPattern filter.
	"Update alerts"
	filter isAlert ifTrue: [ 
		aTerminal alert 
				alertTitle: filter name 
				contents: aString 
				color: filter alertColor ].
	"Update filters"
	windows := aTerminal dependentWindowsOf: self.
	filter send: aString toWindows: (windows select: [ :each | each filter = filter]).
	filter isAlert 
		ifTrue: [ aBlock value ]
		ifFalse: [ eatLinesBlock value: (matchingPattern eatLines ifNil: [0]) ].
	
	^ filter