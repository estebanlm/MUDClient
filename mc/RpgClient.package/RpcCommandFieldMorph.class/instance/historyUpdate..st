accessing history
historyUpdate: ann
	self text asString trimBoth 
		ifNotEmpty: [ :text | self history add: text ].
	self selectAll