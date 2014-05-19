accessing
roots 
	^ RpcNoteNode findAll sorted: [ :a :b | a name < b name ]