accessing
addPoint: aPoint
	(self hasPoint: aPoint) ifTrue: [ ^ self ]. 
	^ points add: aPoint