visitor
visitAll: aCollection 
	stream := (String new: 200) writeStream.
	super visitAll: aCollection.
	^ self contents