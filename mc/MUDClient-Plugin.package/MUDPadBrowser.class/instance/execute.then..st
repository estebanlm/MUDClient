actions
execute: aCommand then: aBlock
	aCommand isDefined
		ifTrue: [ aCommand executeFor: self owner ]
		ifFalse: [ self requestTextForCommand: aCommand then: aBlock ]