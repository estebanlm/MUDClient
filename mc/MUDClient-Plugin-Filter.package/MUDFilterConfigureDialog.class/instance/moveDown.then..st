actions
moveDown: anObject then: aBlock
	self plugin moveFilterDown: anObject.
	aBlock value