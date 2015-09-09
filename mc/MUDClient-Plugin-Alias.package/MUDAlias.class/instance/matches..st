testing
matches: aString
	| stripString |
	stripString := aString trimBoth copyUpTo: Character space.
	^ (self input compare: stripString caseSensitive: false) = 2