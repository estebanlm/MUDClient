printing
printOn: stream 
	super printOn: stream.
	stream << $( << (self pattern ifNil: [ 'Undefined' ]) << $)