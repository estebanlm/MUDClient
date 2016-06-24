accessing
percent 
	(self max = 0 or: [ self value = 0 ])
		ifTrue: [ ^ 0 ].
		
	^ (self value * 100 / self max) asInteger.