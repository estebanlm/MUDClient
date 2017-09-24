Extension { #name : #MAContainerMorph }

{ #category : #'*MUDClient' }
MAContainerMorph >> callInWorldCentered [
	| result |
	result := nil.
	self onAnswer: [ :value | result := value ].
	self morph
		fullBounds;
		position: Display extent - self morph extent // 2.
	self
		openAsIs;
		waitUntilClosed.
	^ result
]

{ #category : #'*MUDClient' }
MAContainerMorph >> openAsIs [
	self morph openAsIs
]
