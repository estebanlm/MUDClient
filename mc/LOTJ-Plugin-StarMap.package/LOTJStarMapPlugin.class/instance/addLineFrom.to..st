accessing
addLineFrom: fromPoint to: toPoint
	self addLine: (LOTJStarMapLine new 
		fromPoint: fromPoint;
		toPoint: toPoint;
		yourself)