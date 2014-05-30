*RpgClient
callInWorldCentered
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self 
		fullBounds;
		openInWorld;
		position: Display extent - self extent // 2;
		waitUntilClosed.
	^ result