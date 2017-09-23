drawing
drawLinesOn: aCanvas
	self isShowMarkers ifFalse: [ ^ self ].
	self starMap lines do: [ :each | 
		aCanvas 
			line: (self sectorToPosition: each fromPoint sector)  
			to: (self sectorToPosition: each toPoint sector) 
			color: each color ]