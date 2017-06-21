accessing
withLevelConnectionsDo: aBlock
	self connections 
		select: [ :each | 
			(each direction isLevel) and: [ each isSimple ] ]
		thenDo: aBlock