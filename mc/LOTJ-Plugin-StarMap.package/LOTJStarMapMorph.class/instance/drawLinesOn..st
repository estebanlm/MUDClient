drawing
drawLinesOn: aCanvas
	self isShowMarkers ifFalse: [ ^ self ].
	self starMap lines ifNotNil: [ :lines |
		lines do: [ :each | 
			aCanvas 
				line: (self sectorToPositionCenter: each fromPoint sector)  
				to: (self sectorToPositionCenter: each toPoint sector) 
				color: each color ] ]