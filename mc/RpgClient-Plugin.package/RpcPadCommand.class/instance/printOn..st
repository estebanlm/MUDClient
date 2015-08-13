printing
printOn: stream 
	stream << (self title ifEmpty: [ 'Undefined' ])