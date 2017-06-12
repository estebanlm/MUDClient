private
traverseAreaRoomsTo: aCollection
	aCollection add: self.
	self connections keysAndValuesDo: [ :direction :room |
		(aCollection includes: room) 
			ifFalse: [ room traverseAreaRoomsTo: aCollection ] ].
	^ aCollection