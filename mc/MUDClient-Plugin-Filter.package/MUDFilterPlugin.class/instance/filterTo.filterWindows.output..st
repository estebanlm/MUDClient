private
filterTo: stream filterWindows: windows output: aString  
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
						filterWindows: windows
						ifUpdateEatingLines: [ :value | nextLinesToFilter := value ]
						ifNotFiltering: [ stream << each; lf ] ]
				ifFalse: [
					windows do: [ :w | w send: each toFilter: lastFilter ].
					nextLinesToFilter := nextLinesToFilter - 1]].
			
	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]