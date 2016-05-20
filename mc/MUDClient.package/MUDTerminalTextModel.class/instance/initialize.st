initialization
initialize
	mutex := Mutex new.
	super initialize.
	self addParseDecoration: MUDANSIDecoration new