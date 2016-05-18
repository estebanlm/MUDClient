printing
printOn: stream 
	super printOn: stream.
	stream << $( << self filter name << $)