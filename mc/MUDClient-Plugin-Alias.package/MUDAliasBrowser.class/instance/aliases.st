accessing
aliases
	^ self plugin aliases sorted: [ :a :b | a name < b name ]