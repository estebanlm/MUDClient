private
filterTo: stream output: aString in: aTerminal  
	| lines nextLinesToFilter eatingFilter "patternMatching" |
	
	lines := aString linesWithLineEnding.
	nextLinesToFilter := 0.

	lines withIndexDo: [ :each :index | 
		nextLinesToFilter = 0
			ifTrue: [ | line |
				line := MUDFilterLine for: each.
				(self allPatternMatchingForLine: each) do: [ :eachMatching |
					nextLinesToFilter := eachMatching filter
						applyFilterOn: self 
						pattern: eachMatching 
						to: stream 
						line: line 
						in: aTerminal.
					nextLinesToFilter > 0 ifTrue: [ eatingFilter := eachMatching filter ] ] ]
			ifFalse: [					
				self forwardLine: each forFilter: eatingFilter in: aTerminal.
				nextLinesToFilter := nextLinesToFilter - 1 ] ]