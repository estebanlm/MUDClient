accessing
addConnection: direction to: aRoom
	| previousConnection |
	
	previousConnection := self connectionAt: direction ifAbsent: [ nil ].
	previousConnection ifNil: [ 
		connections add: (direction connectsTo: aRoom). 
		^ self ].
	(previousConnection includes: aRoom) ifTrue: [ ^ self ].
	connections remove: previousConnection.
	connections add: (previousConnection, aRoom) 	