accessing
valueAt: aName put: aValue
	value ifNil: [ value := SmallDictionary new ].
	value at: aName put: aValue
