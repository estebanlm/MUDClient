private
filterTo: stream output: aString in: aTerminal  
	| lines nextLinesToFilter eatingFilter |
	
	nextLinesToFilter := 0.
	lines := aString linesWithLineEnding.
	lines do: [ :each | | line | 
		line := MUDFilterLine for: each.
		nextLinesToFilter = 0
			ifTrue: [ 
				(self allPatternMatchingForLine: line lineWithoutLineEnding) do: [ :eachMatching |
					nextLinesToFilter := eachMatching filter
						applyFilterOn: self 
						pattern: eachMatching 
						to: stream 
						line: line 
						in: aTerminal.
					nextLinesToFilter > 0 ifTrue: [ eatingFilter := eachMatching filter ] ] ]
			ifFalse: [
				"Just decrease in case I actual eat something (enters do not count)"
				line lineWithoutLineEnding ifNotEmpty: [ 
					self 
						forwardLine: line lineWithoutLineEnding 
						forFilter: eatingFilter 
						in: aTerminal.
					nextLinesToFilter := nextLinesToFilter - 1 ] ] ]