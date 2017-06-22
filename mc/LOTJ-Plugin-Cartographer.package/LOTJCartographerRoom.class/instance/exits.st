accessing
exits
	^ self ROOMEXITS 
		ifNotNil: [ :exits | 
			exits collect: [ :each | 
				LOTJCartographerDirection 
					findByName: each variableName
					ifAbsent: [ LOTJCartographerUnknown named: each variableName ] ] ]
		ifNil: [ #() ]