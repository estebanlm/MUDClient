accessing
exits
	^ self ROOMEXITS collect: [ :each | LOTJCartographerDirection findByName: each variableName ]