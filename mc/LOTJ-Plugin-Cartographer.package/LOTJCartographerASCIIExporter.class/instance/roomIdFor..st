private
roomIdFor: aRoom
	aRoom = self room ifTrue: [ ^ $@ ].
	^ aRoom asciiId