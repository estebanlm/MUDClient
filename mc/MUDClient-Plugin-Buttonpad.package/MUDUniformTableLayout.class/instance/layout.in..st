layout
layout: aMorph in: box
	| numberOfCells fixedSize |

	aMorph assureTableProperties.
	numberOfCells := aMorph submorphCount.
	"fixedSize := (box extent x - (aMorph cellInset * numberOfCells) / numberOfCells) asInteger."
	fixedSize := 0@0. "this is a magix number to force an adjust. No idea why it works... but it works"
	aMorph maxCellSize: fixedSize.
	aMorph minCellSize: fixedSize.

	^ super layout: aMorph in: box