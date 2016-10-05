private
applyTriggerFilter: aFilter to: aStream line: aLine in: aTerminal
	aTerminal 
		sendFilteringInput: aFilter output  
		excluding: self.
	^ self applyNullFilterTo: aStream line: aLine in: aTerminal