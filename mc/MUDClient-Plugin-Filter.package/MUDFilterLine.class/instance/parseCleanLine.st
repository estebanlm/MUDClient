private
parseCleanLine
	| parsed |
	parsed := (MUDANSIParser default 
		parse: self lineWithoutLineEnding  
		onError: [ {MUDANSIText new text: self lineWithoutLineEnding } ]).
	^ MUDANSITextCleaner visitAll: parsed