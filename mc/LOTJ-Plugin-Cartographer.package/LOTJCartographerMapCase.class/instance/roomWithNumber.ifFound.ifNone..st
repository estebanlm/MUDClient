accessing
roomWithNumber: aNumber ifFound: foundBlock ifNone: noneBlock
	self maps do: [ :each |
		each 
			roomWithNumber: aNumber
			ifFound: [ :room | ^ foundBlock cull: room ]
			ifNone: [ ] ].
	^ noneBlock value