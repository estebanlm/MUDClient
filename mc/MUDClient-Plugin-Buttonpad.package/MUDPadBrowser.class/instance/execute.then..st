actions
execute: aCommand then: aBlock
	aCommand isDefined
		ifTrue: [ aCommand executeOn: self owner ]
		ifFalse: [ self requestTextForCommand: aCommand then: aBlock ]