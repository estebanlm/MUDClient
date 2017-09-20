drawing
dracConnection: aConnection on: canvas
	| mod fromPoint toPoint |

	 mod := aConnection direction coordinateModifier.
	fromPoint := self center + (mod * 5).
	toPoint := self center + (mod * (self owner roomSeparation / 2) * aConnection distance) asIntegerPoint.
	canvas
		line: fromPoint
		to: toPoint
		width: 1
		color: self connectionColor