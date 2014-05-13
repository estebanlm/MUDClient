private
parse: aCollection 
	aCollection do: [ :each |
		each < 30 ifTrue: [ self parseIntensity: each ].
		(each between: 30 and: 37) ifTrue: [ self parseForegroundColor: each - 30 ].
		(each between: 40 and: 47) ifTrue: [ self parseBackgroundColor: each - 40 ] ]
	