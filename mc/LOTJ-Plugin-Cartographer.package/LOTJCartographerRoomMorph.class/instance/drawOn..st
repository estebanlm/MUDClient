drawing
drawOn: canvas 
	super drawOn: canvas.
	self room withLevelConnectionsDo: [ :each | | fromPoint toPoint |
		fromPoint := self center + (each direction coordinateModifier * 5).
		toPoint := self center + (each direction coordinateModifier * self owner roomSeparation).
		canvas 
			line: fromPoint 
			to: toPoint
			width: 1 
			color: Color white ]