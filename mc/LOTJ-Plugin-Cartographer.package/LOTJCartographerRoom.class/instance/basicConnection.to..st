private
basicConnection: direction to: aRoom
	| previousConnection |
	
	previousConnection := self connectionAt: direction ifAbsent: [ nil ].
	previousConnection ifNil: [ 
		connections add: (direction connectsTo: aRoom). 
		^ self ].
	(previousConnection includes: aRoom) ifTrue: [ ^ self ].
	connections remove: previousConnection ifAbsent: [].
	connections add: (previousConnection, aRoom) 	