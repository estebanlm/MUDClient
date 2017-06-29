drawing
drawOn: aCanvas
	self needsDisplay ifTrue: [ self calculateLevel ].
	super drawOn: aCanvas