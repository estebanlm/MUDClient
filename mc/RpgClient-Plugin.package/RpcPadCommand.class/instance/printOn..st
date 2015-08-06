printing
printOn: stream 
	stream << (self title ifNil: [ 'Undefined' ])