printing
printOn: stream
	stream << self name << ' - ' << (self system ifNil: [ 'Unknown' ]) << ' ' << self sector asString