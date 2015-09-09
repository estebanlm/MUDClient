private
nextName
	| nextName index |
	
	index := 0.
	[ 
		index := index + 1.
		nextName := 'Pad ', index asString.
		self pads anySatisfy: [ :each | each name = nextName ] ]
	whileTrue.
	
	^ nextName