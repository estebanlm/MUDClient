actions
cloneAs: aString
	| exported clonedGame |
	
	"easiest way is to export/import game"
	exported := String streamContents: [ :stream | STON put: self onStream: stream ].
	clonedGame := STON fromStream: exported readStream.
	clonedGame name: aString.
	^ clonedGame