*RpgClient
callInWorldCentered
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self morph
		fullBounds;
		position: Display extent - self morph extent // 2.
	self
		openInWorld;
		waitUntilClosed.
	^ result