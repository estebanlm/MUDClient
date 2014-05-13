accessing
games 
	^ games ifNil: [ games := OrderedCollection withAll: RpcGame findAll ]