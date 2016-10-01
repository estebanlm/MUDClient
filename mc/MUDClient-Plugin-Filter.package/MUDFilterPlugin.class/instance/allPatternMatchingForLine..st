private
allPatternMatchingForLine: aString 
	| cleanString matchingFilters |
	
	cleanString := self class cleanText: aString.
	matchingFilters := Set new.
	"Collect all possible filters"
	self activeFilters do: [ :each |  
		(each patternMatching: cleanString) 
			ifNotNil: [ :pattern | matchingFilters add: pattern ] ].
	"If none satisfy, then I add a simple null filter (to ensure an output)"
	matchingFilters ifEmpty: [ 
		matchingFilters add: (MUDFilterPattern new filter: MUDNullFilter new) ].
	
	^ matchingFilters