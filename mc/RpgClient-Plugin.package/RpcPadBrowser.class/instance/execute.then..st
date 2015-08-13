actions
execute: aCommand then: aBlock
	aCommand isDefined
		ifTrue: [ aCommand executeFor: self ]
		ifFalse: [ self requestTextForCommand: aCommand then: aBlock ]