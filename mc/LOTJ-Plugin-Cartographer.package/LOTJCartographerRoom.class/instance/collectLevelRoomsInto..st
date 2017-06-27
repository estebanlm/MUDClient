private
collectLevelRoomsInto: aCollection
	(aCollection includes: self) ifTrue: [ ^ aCollection ].
	aCollection add: self.
	self withLevelConnectionsDo: [ :each |
		each room collectLevelRoomsInto: aCollection ].
	^ aCollection