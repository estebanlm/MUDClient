accessing
findMatchFor: aBrowser ifNone: aBlock
	^ (self selectOne: [ :each | aBrowser isSettingsMatching: each ])
		ifNil: aBlock