decorating
decorate: aString
	| stream |
	stream := VTermOutputDriver on: String new writeStream.
	stream light; white.
	Time now print24: true showSeconds: false on: stream.
	stream reset.
	stream
		space;
		nextPutAll: aString.
	^ stream outStream contents