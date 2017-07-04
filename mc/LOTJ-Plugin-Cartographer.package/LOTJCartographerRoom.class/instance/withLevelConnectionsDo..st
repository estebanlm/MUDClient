accessing
withLevelConnectionsDo: aBlock
	self type isTerminal ifTrue: [ ^ self ].
	self connections 
		select: [ :each | 
			(each direction isLevel) and: [ each isSimple ] ]
		thenDo: aBlock