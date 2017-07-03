private
calculateLevel
	| roomMorphs |

	needsDisplay := false.

	selectedRoom ifNil: [ ^ self ].
	roomMorphs := OrderedCollection new.
	self 
		addRoom: selectedRoom 
		position: self bounds center
		into: roomMorphs.
	roomMorphs do: [ :each | each privateOwner: self ].
	submorphs := (roomMorphs 
		select: [ :each | self isVisible: each ])
		asArray