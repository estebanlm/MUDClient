private
parseCleanLine
	| parsed |
	parsed := (MUDFilterPlugin ansiParser 
		parse: self lineWithoutLineEnding  
		onError: [ {MUDANSIText new text: self lineWithoutLineEnding } ]).
	^ MUDANSITextCleaner visitAll: parsed
	