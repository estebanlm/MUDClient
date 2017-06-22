accessing
findByName: aString ifAbsent: aBlock
	| selector |
	selector := aString asLowercase asSymbol.
	^ (self class includesSelector: selector)
		ifTrue: [ self perform: selector ]
		ifFalse: aBlock