accessing
record: aString
	self log writeStreamDo: [ :stream | 
		stream setToEnd.
		stream << aString ]