accessing
allGames 
	^ games ifNil: [ games := OrderedCollection withAll: RpcGame findAll ]