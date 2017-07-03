actions
removeLevel
	"self actualRoom withAllLevelRoomsDo: [ :each | 
		self rooms 
			removeKey: each number
			ifAbsent: [ ] ]."
