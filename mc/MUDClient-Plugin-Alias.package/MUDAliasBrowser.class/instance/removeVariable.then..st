actions
removeVariable: aVariable then: aBlock
	(self confirm: ('Are you sure you want to remove variable {1}' format: { aVariable name }))
		ifFalse: [ ^ self ].
	self plugin removeVariable: aVariable. 
	aBlock value
	