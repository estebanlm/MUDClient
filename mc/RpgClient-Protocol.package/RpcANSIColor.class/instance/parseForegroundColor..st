private
parseForegroundColor: aNumber 
	foregroundColor := self isBold 
		ifTrue: [ self class brightColorMapAt: aNumber ]
		ifFalse: [ self class normalColorMapAt: aNumber ]