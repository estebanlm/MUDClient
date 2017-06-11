printing
printOn: stream 
	stream << self number asString << ' - ' << (self name ifNil: [ 'NONAME' ])