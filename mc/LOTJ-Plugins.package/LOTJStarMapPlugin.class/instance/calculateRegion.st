accessing
calculateRegion
	| left top right bottom point |
	
	point := self points anyOne point. 
	left := right := point x.
	top := bottom := point y.
	self points do: [ :each |
		left > each point x ifTrue: [ left := each point x ].
		right < each point x ifTrue: [ right := each point x ].
		top > each point y ifTrue: [ top := each point y ].
		bottom < each point y ifTrue: [ bottom := each point y ] ].
	
	^ (left@top corner: right@bottom) expandBy: self class expandedRegionSize