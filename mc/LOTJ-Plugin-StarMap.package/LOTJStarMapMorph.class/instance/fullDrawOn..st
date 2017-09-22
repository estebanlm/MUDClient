drawing
fullDrawOn: aCanvas
	aCanvas drawMorph: self.
	self drawGridOn: aCanvas.
	self drawSubmorphsOn: aCanvas.
	self drawLinesOn: aCanvas