private session
closeSession
	(self session isNil or: [ self session isConnected not ]) ifTrue: [ ^ self ].
	self session close