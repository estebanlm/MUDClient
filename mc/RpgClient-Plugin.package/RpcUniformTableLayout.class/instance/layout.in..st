layout
layout: aMorph in: box
	| numberOfCells fixedSize |
	aMorph assureTableProperties.
	numberOfCells := aMorph submorphCount.
	fixedSize := (box extent - (aMorph cellInset * numberOfCells) / numberOfCells).
	aMorph maxCellSize: fixedSize.
	aMorph minCellSize: fixedSize.
	^ super layout: aMorph in: box