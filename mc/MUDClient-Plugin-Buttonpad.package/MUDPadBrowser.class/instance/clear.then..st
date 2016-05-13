actions
clear: aCommand then: aBlock
	aCommand isDefined ifFalse: [ ^ self ].

	aCommand clear.
	aBlock value