parsing
parse: aStringOrText
	| ansiText |
	
	ansiText := self formatter visitAll: (self parser 
		parse: aStringOrText
		onError: [ ^ self parseNext: aStringOrText ]).
		
	^ self parseNext: ansiText