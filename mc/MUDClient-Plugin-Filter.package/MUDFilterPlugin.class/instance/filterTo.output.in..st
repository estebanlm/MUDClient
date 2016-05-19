private
filterTo: stream output: aString in: aTerminal  
	| lines nextLinesToFilter lastFilter |
	
	lines := aString lines.
	nextLinesToFilter := 0.

	"lines first ifEmpty: [ stream lf ]."
	lines 
		select: [ :each | each notEmpty ]
		thenDo: [ :each | 
			nextLinesToFilter = 0
				ifTrue: [  
					lastFilter := self 
						filter: each 
						in: aTerminal
						ifUpdateEatingLines: [ :value | nextLinesToFilter := value ]
						ifNotFiltering: [ stream << each; lf ] ]
				ifFalse: [
					(aTerminal dependentWindowsOf: self) 
						do: [ :w | w send: each toFilter: lastFilter ].
					nextLinesToFilter := nextLinesToFilter - 1]].
			
	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]