private
saveToDisk
	| fileReference |
	
	fileReference := self repositoryFileName.
	fileReference ensureDelete.
	FLSerializer 
		serialize: self current
		toFileNamed: fileReference fullName