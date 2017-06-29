building
build
	| size center matrix |
	
	"2 to have the full area (I will strip it later) and 2 to give space for connectors"
	size := self calculateLevelSize * 5. 
	center := (size / 2) asIntegerPoint. 
	matrix := Matrix rows: size x columns: size y.
	self traverseRoom: self room position: 0@0 do: [ :eachRoom :position | | roomPos |
		"Yep, inverted :)"
		roomPos := center + (position inversed * 2). 
		matrix 
			at: roomPos x 
			at: roomPos y 
			put: (self roomIdFor: eachRoom).
		eachRoom withLevelConnectionsDo: [ :eachConnection | | connectionPos |
			connectionPos := roomPos + eachConnection direction coordinateModifier inversed. 
			matrix 
				at: connectionPos x 
				at: connectionPos y 
				put: eachConnection direction asciiConnector ] ].
	^ String streamContents: [ :stream | 
		(matrix rows 
			reject: [ :each | each allSatisfy: #isNil ])
			do: [ :eachRow | eachRow do: [ :each | stream << (each ifNil: [ Character space ]) ] ]
			separatedBy: [ stream cr ] ].