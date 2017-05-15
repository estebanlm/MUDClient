private
incrementWrite

	writeIndex := self increment: writeIndex.
	
	overlapp ifTrue: [ self incrementRead ].
	overlapp := writeIndex = readIndex