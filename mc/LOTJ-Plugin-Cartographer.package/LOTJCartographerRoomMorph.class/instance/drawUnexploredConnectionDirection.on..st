drawing
drawUnexploredConnectionDirection: aDirection on: canvas
	| fromPoint toPoint mod |

	mod := aDirection coordinateModifier.
	fromPoint := self center + (mod * 5).
	toPoint := self center + (mod * 10).
	canvas
		line: fromPoint
		to: toPoint
		width: 1
		color: self connectionColor