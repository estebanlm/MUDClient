testing
matchesUniqueString: line
	^ (line rawLine
		compare: self keywords first value 
		caseSensitive: false) == 2