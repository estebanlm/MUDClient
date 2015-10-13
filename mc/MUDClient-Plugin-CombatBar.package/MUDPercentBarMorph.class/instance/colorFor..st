drawing
colorFor: percent
	self colorPairs do: [ :each |
		each key <= percent ifTrue: [ ^ each value ] ].
	
	^ self color