Class {
	#name : #MUDGameTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Tests'
}

{ #category : #tests }
MUDGameTest >> testNameHostPort [ 
	| game |
	
	game := MUDGame name: 'Asteroid' host: 'localhost' port: 5555.
	self assert: game name equals: 'Asteroid'.
	self assert: game host equals: 'localhost'.
	self assert: game port equals: 5555
]
