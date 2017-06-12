private
traverseAreaRoomsTo: aCollection 
	(aCollection includes: self) ifTrue: [ ^ aCollection ].
	aCollection add: self.
	"self rooms do: [ :each | 
		(aCollection includes: each)
			ifFalse: [ each traverseAreaRoomsTo: aCollection] ]."
	^ aCollection