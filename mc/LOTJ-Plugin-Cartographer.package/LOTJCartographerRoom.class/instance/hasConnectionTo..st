testing
hasConnectionTo: aDirection
	self connectionAt: aDirection ifAbsent: [ ^ false ].
	^ true