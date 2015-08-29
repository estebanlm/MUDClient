accessing
objects
	^ MUDGame findAll sorted: [ :a :b | a name < b name ]