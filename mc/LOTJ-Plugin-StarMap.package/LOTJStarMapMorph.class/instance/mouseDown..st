event handling
mouseDown: event
	| sector point |
	super mouseDown: event.
	sector := self positionToSector: event position.
	point := self starMap 
		pointAtSector: sector 
		ifAbsent: [ LOTJStarMapSpacePoint sector: sector ].
	point ifNotNil: [
		self selected: point.
		self update.
		selectionBlock ifNotNil: [ selectionBlock value: point ]. ]