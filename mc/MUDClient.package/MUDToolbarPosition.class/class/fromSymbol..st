accessing
fromSymbol: aSymbol
	^ (self allSubclasses
		detect: [ :each | each kind = aSymbol ])
		uniqueInstance