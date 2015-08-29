accessing
directory
	^ (MUDSessionLog baseDirectory / self game name) ensureCreateDirectory	
