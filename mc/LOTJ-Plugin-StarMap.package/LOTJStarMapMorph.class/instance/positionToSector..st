private
positionToSector: aPoint
	| center point modY modX |
	
	point := aPoint / self sectorSize.
	center := self regionRectangle extent / 2.
	modX := point x < center x ifTrue: [ 1 ] ifFalse: [ 0 ].
	modY := point y < center y ifTrue: [ 1 ] ifFalse: [ 0 ]. 
	^ (point x + center x negated - modX) asInteger @ (point y negated + center y + modY) asInteger