private
toPoint: aString
	| pointParts |
	pointParts := (aString copyWithoutAll: '()') substrings: ','.
	^ pointParts first trimBoth asNumber @ pointParts second trimBoth asNumber