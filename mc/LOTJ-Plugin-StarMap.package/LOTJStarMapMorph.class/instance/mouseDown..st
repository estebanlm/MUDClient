event handling
mouseDown: event
	| sector point |
	super mouseDown: event.
	sector := self positionToSector: event position.
	point := self starMap pointAtSector: sector ifAbsent: [ nil ].
	point ifNotNil: [
		point crLog. 
		self selected: point.
		self update.
		selectionBlock ifNotNil: [ selectionBlock value: point ]. ]