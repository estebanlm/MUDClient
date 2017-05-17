private
sectorToPosition: aPoint
	| center point |
	
	point := aPoint * self sectorSize.
	center := (self regionRectangle extent / 2) * self sectorSize.
	^ point x @ (point y negated) + center
