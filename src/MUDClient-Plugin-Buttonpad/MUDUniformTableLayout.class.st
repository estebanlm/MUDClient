"
I'm a table layout who forces all cell elements to have same size (and to be proportional to owner size)
"
Class {
	#name : #MUDUniformTableLayout,
	#superclass : #TableLayout,
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #layout }
MUDUniformTableLayout >> layout: aMorph in: box [
	| numberOfCells fixedSize |

	aMorph assureTableProperties.
	numberOfCells := aMorph submorphCount.
	"fixedSize := (box extent x - (aMorph cellInset * numberOfCells) / numberOfCells) asInteger."
	fixedSize := 0@0. "this is a magix number to force an adjust. No idea why it works... but it works"
	aMorph maxCellSize: fixedSize.
	aMorph minCellSize: fixedSize.

	^ super layout: aMorph in: box
]
