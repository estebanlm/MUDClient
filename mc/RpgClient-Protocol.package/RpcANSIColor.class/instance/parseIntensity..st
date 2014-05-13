private
parseIntensity: aNumber 
	aNumber = 0 ifTrue: [ bold := false ].	
	aNumber = 1 ifTrue: [ bold := true ].