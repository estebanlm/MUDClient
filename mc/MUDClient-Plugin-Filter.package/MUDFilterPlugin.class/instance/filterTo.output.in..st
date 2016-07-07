private
filterTo: stream output: aString in: aTerminal  
	| lines nextLinesToFilter lastFilter patternMatching |
	
	lines := aString lines.
	nextLinesToFilter := 0.

	"lines first ifEmpty: [ stream lf ]."
	lines 
		select: [ :each | each notEmpty ]
		thenDo: [ :each | 
			nextLinesToFilter = 0
				ifTrue: [  
					patternMatching := self filterPatternForLine: each.
					lastFilter := patternMatching 
						ifNotNil: [ patternMatching filter ]
						ifNil: [ MUDNullFilter new ].
					nextLinesToFilter := lastFilter 
						applyFilterOn: self 
						pattern: patternMatching 
						to: stream 
						line: each 
						in: aTerminal ]
				ifFalse: [				
					self forwardLine: each forFilter: lastFilter in: aTerminal.
					nextLinesToFilter := nextLinesToFilter - 1]].

	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]