accessing
withLevelConnectionsDo: aBlock
	self connections 
		select: [ :each | each direction isLevel ]
		thenDo: aBlock