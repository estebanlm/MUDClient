initialization
removeBoxes
	expandBox ifNotNil: [expandBox delete. expandBox := nil].
	collapseBox ifNotNil: [collapseBox delete. collapseBox := nil]