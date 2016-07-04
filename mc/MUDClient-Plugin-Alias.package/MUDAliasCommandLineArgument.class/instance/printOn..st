printing
printOn: stream 
	self quantity 
		ifNotNil: [ stream << self quantity << ' ' ].
	stream << self value