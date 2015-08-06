visitor
visitAll: aCollection
	self text: '' asText.
	super visitAll: aCollection.
	^ self text