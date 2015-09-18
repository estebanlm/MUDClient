private
filterTo: stream filterWindows: windows output: aString  
	| lines filterNext lastFilter |
	
	lines := aString lines.
	filterNext := 0.

	"lines first ifEmpty: [ stream lf ]."
	lines 
		select: [ :each | each notEmpty ]
		thenDo: [ :each | 
			filterNext = 0
				ifTrue: [  
					lastFilter := self filterForLine: each.
					lastFilter
						ifNotNil: [ 
							windows do: [ :w | w send: each toFilter: lastFilter].
							filterNext := lastFilter eatLines ifNil: [0]]
						ifNil: [ stream << each; lf ]]
				ifFalse: [
					windows do: [ :w | w send: each toFilter: lastFilter ].
					filterNext := filterNext - 1]].
			
	"Extra lf if last one was an empty line"
	lines last ifEmpty: [ stream lf ]