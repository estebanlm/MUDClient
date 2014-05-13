accessing
addParseDecoration: aDecoration 
	| last |
	
	parseDecoration ifNil: [ ^ parseDecoration := aDecoration ].
	last := parseDecoration.
	[ last next isNil ] whileFalse: [ last := last next ]. 
	last next: aDecoration