private
restoreFromDisk
	| fileReference |
	
	fileReference := self repositoryFileName.
	fileReference exists 
		ifTrue: [ self setRepository: (FLMaterializer materializeFromFileNamed: fileReference fullName) ]
		ifFalse: [ self install ].
