commands
subcommand: aBlock 
	stream << IAC << SB << MSDP.
	aBlock cull: self.
	stream << IAC << SE
