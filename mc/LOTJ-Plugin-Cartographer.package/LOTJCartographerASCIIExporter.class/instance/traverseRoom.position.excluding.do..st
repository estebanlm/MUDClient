private
traverseRoom: aRoom position: aPoint excluding: excludes do: aBlock  
	"Exit if is already there"
	(excludes includes: aRoom) ifTrue: [ ^ self ].

	excludes add: aRoom.
	aBlock cull: aRoom cull: aPoint.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			traverseRoom: each room 
			position: (aPoint + each direction coordinateModifier)
			excluding: excludes
			do: aBlock ]