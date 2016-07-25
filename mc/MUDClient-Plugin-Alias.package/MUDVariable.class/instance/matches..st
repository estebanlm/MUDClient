testing
matches: aString
	^ (aString endsWith: self name) 
		or: [ (aString includesSubstring: (self name copyWith: Character space) caseSensitive: false) 
		or: [ aString includesSubstring: (self name copyWith: Character cr) caseSensitive: false ] ]