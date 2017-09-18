private factory
createTypeActions
	^ LOTJCartographerRoomType allTypes
		collect: [ :each | self createTypeActionFor: each ]