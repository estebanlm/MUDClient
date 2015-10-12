commands
put: anObject 
	stream << MSDP_VAL.
	anObject acceptCommand: self.