visitor
visitDictionary: aDictionary
	aDictionary keysAndValuesDo: [ :var :val | 
		self at: var put: val ].
