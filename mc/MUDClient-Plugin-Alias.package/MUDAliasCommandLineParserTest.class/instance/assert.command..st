tests
assert: command command: aCollection
	| readStream |
	
	readStream := aCollection readStream.
	command keywords do: [ :each | 
		self assert: each value equals: readStream next.
		each argument 
			ifNotNil: [ | argument |
				argument := readStream next.
				self assert: each argument value equals: argument first.
				self assert: each argument quantity equals: argument second ]
			ifNil: [
				self assert: readStream next isNil ].
			
		]