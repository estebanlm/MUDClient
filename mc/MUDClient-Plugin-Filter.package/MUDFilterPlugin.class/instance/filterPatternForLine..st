private
filterPatternForLine: aString 
	| cleanString |
	cleanString := self class cleanText: aString.
	self activeFilters do: [ :each |  
		(each patternMatching: cleanString) 
			ifNotNil: [ :pattern | ^ pattern ] ].
	^ nil