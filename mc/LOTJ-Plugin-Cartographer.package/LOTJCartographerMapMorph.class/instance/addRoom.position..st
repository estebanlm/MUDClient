private
addRoom: aRoom position: aPoint
	| roomMorph |
	
	"Exit if is already there"
	(self submorphs anySatisfy: [ :each | each room = aRoom ]) 
		ifTrue: [ ^ self ].
	
	roomMorph := aRoom asMorph.
	aRoom = selectedRoom ifTrue: [ roomMorph beSelected ].
	roomMorph position: aPoint.
	self addMorph: roomMorph.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			addRoom: each room 
			position: (aPoint + (each direction coordinateModifier * self roomSeparation)) ]