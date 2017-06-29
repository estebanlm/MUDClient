private
calculateLevelSize
	| minX maxX minY maxY |
	minX := maxX := minY := maxY := 0.
	self traverseRoom: self room position: 0@0 do: [ :each :position | 
		minX := minX min: position x.
		minY := minY min: position y.
		maxX := maxX max: position x.
		maxY := maxY max: position y ].
	^ (maxX - minX) @ (maxY - minY)
