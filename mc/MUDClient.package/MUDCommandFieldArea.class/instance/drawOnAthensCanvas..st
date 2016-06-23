drawing
drawOnAthensCanvas: anAthensCanvas
	self mutex critical: [ 
		super drawOnAthensCanvas: anAthensCanvas ]