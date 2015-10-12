commands
list: aCollectionOrBlock 
	stream << MSDP_ARRAY_OPEN.
	aCollectionOrBlock acceptCommand: self.	
	stream << MSDP_ARRAY_CLOSE.		