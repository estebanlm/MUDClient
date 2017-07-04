private
calculateLevel
	| roomMorphs |

	needsDisplay := false.

	currentRoom ifNil: [ ^ self ].
	roomMorphs := OrderedCollection new.
	self 
		addRoom: currentRoom 
		position: self bounds center
		into: roomMorphs.
	roomMorphs do: [ :each | each privateOwner: self ].
	submorphs := (roomMorphs 
		select: [ :each | self isVisible: each ])
		asArray