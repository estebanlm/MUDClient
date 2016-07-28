private
cut: aString on: points
	| previous strings |
	previous := 1.
	strings := Array new: points size + 1.
	"Extract chunks"
	points withIndexDo: [ :each :index | 
		strings 
			at: index 
			put: (aString copyFrom: previous to: each) trimBoth.
		previous := each + 1 ].
	"Add remaining"
	strings 
		at: (points size + 1) 
		put: (aString copyFrom: previous to: aString size) trimBoth.
	^ strings