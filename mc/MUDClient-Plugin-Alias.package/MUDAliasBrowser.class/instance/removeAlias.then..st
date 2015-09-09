actions
removeAlias: anAlias then: aBlock
	(self confirm: ('Are you sure you want to remove alias {1}' format: { anAlias name }))
		ifFalse: [ ^ self ].
	self plugin removeAlias: anAlias. 
	aBlock value
	