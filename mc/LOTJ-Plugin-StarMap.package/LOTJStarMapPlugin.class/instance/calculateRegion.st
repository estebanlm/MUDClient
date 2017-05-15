accessing
calculateRegion
	| left top right bottom point |
	
	point := self points anyOne sector. 
	left := right := point x.
	top := bottom := point y.
	self points do: [ :each |
		left > each sector x ifTrue: [ left := each sector x ].
		right < each sector x ifTrue: [ right := each sector x ].
		top > each sector y ifTrue: [ top := each sector y ].
		bottom < each sector y ifTrue: [ bottom := each sector y ] ].
	
	^ (left@top corner: right@bottom) expandBy: self class expandedRegionSize