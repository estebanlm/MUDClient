actions
removeObject: anObject then: aBlock
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { anObject name }))
		ifFalse: [ ^ false ].
	self basicRemoveObject: anObject.
	aBlock value