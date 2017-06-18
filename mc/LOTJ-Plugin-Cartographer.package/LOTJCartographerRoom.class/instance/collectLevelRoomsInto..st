private
collectLevelRoomsInto: aCollection
	self connections do: [ :each |
		each collectLevelRoomsInto: aCollection ].
	^ aCollection