accessing
asciiId
	"This is for the ASCII exporter"
	(self hasConnectionTo: LOTJCartographerDirection unknown) ifTrue: [ ^ $+ ].
	(self hasConnectionTo: LOTJCartographerDirection up) ifTrue: [ ^ $< ].
	(self hasConnectionTo: LOTJCartographerDirection down) ifTrue: [ ^ $> ].
	^ self type asciiId