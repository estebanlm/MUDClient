accessing history
historyUpdate: ann
	self history add: self text asString.
	self selectAll