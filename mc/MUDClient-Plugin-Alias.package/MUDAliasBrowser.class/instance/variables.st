accessing
variables
	^ self plugin variables sorted: [ :a :b | a name < b name ]