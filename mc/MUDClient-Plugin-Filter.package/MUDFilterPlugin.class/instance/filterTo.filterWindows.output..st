private
filterTo: stream filterWindows: windows output: aString  
	| lines nextLinesToFilter lastMatchingPattern |
	
	lines := aString lines.
	nextLinesToFilter := 0.

	"lines first ifEmpty: [ stream lf ]."
	lines 
		select: [ :each | each notEmpty ]
		thenDo: [ :each | 
			nextLinesToFilter = 0
				ifTrue: [  
					lastMatchingPattern := self filterPatternForLine: each.
					lastMatchingPattern
						ifNotNil: [ 
							windows do: [ :w | w send: each toFilter: lastMatchingPattern filter ].
							nextLinesToFilter := lastMatchingPattern eatLines ifNil: [0]]
						ifNil: [ stream << each; lf ]]
				ifFalse: [
					windows do: [ :w | w send: each toFilter: lastMatchingPattern filter ].
					nextLinesToFilter := nextLinesToFilter - 1]].
			
	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]