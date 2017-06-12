adding
add: aRoom 
	(rooms includes: aRoom) ifTrue: [ ^ self ]. 
	rooms add: aRoom