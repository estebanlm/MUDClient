instance creation
importFromFileNamed: aString
	^ aString asFileReference 
		readStreamDo: [ :stream | self importFrom: stream ] 