accessing
addConnection: direction to: aRoom
	| previousRoom |
	
	previousRoom := self connections at: direction ifAbsent: [ nil ].
	previousRoom = aRoom ifTrue: [ ^ self ].
	
	self connections 
		at: direction 
		put: (previousRoom 
			ifNotNil: [ previousRoom, aRoom ]
			ifNil: [ aRoom ])