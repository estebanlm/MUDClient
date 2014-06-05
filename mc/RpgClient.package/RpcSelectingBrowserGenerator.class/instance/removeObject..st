actions
removeObject: anObject
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { anObject name }))
		ifFalse: [ ^ false ].
	self basicRemoveObject: anObject.
	^ true