printing
printOn: stream 
	super printOn: stream.
	stream << $( << self game name << ', ' << self browserClass name << $)