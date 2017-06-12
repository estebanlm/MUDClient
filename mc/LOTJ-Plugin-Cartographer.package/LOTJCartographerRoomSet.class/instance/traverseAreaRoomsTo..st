private
traverseAreaRoomsTo: aCollection 
	(aCollection includes: self) ifTrue: [ ^ aCollection ].
	aCollection add: self.
	"Set rooms are natural stops (because we don't know where to go) "
	"self rooms do: [ :each | 
		(aCollection includes: each)
			ifFalse: [ each traverseAreaRoomsTo: aCollection] ]."
	^ aCollection