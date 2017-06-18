accessing
connectionAt: aDirection ifAbsent: aBlock
	^ self connections 
		detect: [ :each | each direction = aDirection ] 
		ifNone: aBlock