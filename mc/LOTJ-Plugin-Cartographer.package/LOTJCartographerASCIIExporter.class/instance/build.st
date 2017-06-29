building
build
	| size center matrix |
	
	size := self calculateLevelSize * 3.
	center := (size / 2) asIntegerPoint. 
	matrix := Matrix rows: size x columns: size y.
	self traverseRoom: self room position: 0@0 do: [ :eachRoom :position | | m |
		"Yep, inverted :)"
		m := center + (position y @ position x) + (1@1). 
		matrix at: m x at: m y put: (self roomIdFor: eachRoom) ].
	^ String streamContents: [ :stream | 
		(matrix rows 
			reject: [ :each | each allSatisfy: #isNil ])
			do: [ :eachRow | eachRow do: [ :each | stream << (each ifNil: [ $. ]) ] ]
			separatedBy: [ stream cr ] ].