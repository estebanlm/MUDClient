tests
testNameHostPort 
	| game |
	
	game := RtcGame name: 'Asteroid' host: 'localhost' port: 5555.
	self assert: game name equals: 'Asteroid'.
	self assert: game host equals: 'localhost'.
	self assert: game port equals: 5555