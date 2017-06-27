actions
removeLevel
	self actualRoom levelRooms 
		collect: #number
		thenDo: [ :each | 
			self rooms 
				removeKey: each
				ifAbsent: [ ] ]