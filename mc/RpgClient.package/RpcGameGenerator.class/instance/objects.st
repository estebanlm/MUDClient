accessing
objects
	^ RpcGame findAll sorted: [ :a :b | a name < b name ]