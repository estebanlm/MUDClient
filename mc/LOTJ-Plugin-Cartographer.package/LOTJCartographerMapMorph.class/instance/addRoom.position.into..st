private
addRoom: aRoom position: aPoint into: aCollection
	| roomMorph |
	 
	"Exit if is already there"
	(aCollection anySatisfy: [ :each | 
		"If room is already added or possition is occupied, we do not show 
		this room, and we end adding rooms here."
		(each room = aRoom) or: [ each position = aPoint ] ]) 
		ifTrue: [ ^ self ].
	
	roomMorph := aRoom asMorph.
	aRoom = selectedRoom ifTrue: [ roomMorph beSelected ].
	aRoom = currentRoom ifTrue: [ roomMorph beCurrent ]. 
	roomMorph position: aPoint.
	aCollection add: roomMorph.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			addRoom: each room 
			position: (aPoint + (each direction coordinateModifier * (self roomSeparation * each distance)))
			into: aCollection ]