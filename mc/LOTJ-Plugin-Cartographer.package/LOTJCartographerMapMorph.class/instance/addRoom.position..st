private
addRoom: aRoom position: aPoint
	| roomMorph |
	
	"Exit if is already there"
	(self submorphs anySatisfy: [ :each | 
		"If room is already added or possition is occupied, we do not show 
		this room, and we end adding rooms here."
		(each room = aRoom) or: [ each position = aPoint ] ]) 
		ifTrue: [ ^ self ].
	
	roomMorph := aRoom asMorph.
	aRoom = selectedRoom ifTrue: [ roomMorph beSelected ].
	roomMorph position: aPoint.
	self addMorph: roomMorph.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			addRoom: each room 
			position: (aPoint + (each direction coordinateModifier * self roomSeparation)) ]