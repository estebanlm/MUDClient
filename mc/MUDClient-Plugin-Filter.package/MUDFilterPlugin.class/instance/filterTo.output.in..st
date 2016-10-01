private
filterTo: stream output: aString in: aTerminal  
	| lines nextLinesToFilter eatingFilter "patternMatching" |
	
	lines := aString lines.
	nextLinesToFilter := 0.

	"lines first ifEmpty: [ stream lf ]."
	lines 
		select: [ :each | each notEmpty ]
		thenDo: [ :each |
			nextLinesToFilter = 0
				ifTrue: [ 
					(self allPatternMatchingForLine: each) do: [ :eachMatching |
						nextLinesToFilter := eachMatching filter
							applyFilterOn: self 
							pattern: eachMatching 
							to: stream 
							line: each 
							in: aTerminal.
						nextLinesToFilter > 0 ifTrue: [ eatingFilter := eachMatching filter ] ] ]
				ifFalse: [				
					self forwardLine: each forFilter: eatingFilter in: aTerminal.
					nextLinesToFilter := nextLinesToFilter - 1]].

	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]