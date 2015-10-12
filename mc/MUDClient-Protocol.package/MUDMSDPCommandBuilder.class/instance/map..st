commands
map: aDictionaryOrBlock 
	stream << MSDP_TABLE_OPEN.
	aDictionaryOrBlock acceptCommand: self.	
	stream << MSDP_TABLE_CLOSE.	