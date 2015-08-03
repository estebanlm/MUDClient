private
parseBackgroundColor: aNumber 
	backgroundColor := self isBold 
		ifTrue: [ self class brightColorMapAt: aNumber ]
		ifFalse: [ self class normalColorMapAt: aNumber ]