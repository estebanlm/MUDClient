private
filterForLine: aString 
	| cleanString |
	cleanString := self class cleanText: aString.
	^ self activeFilters 
		detect: [ :each | each matches: cleanString ]
		ifNone: [ nil ]