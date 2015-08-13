actions
doReconnect
	self game ifNotNil: [ self disconnect ].
	self connectTo: self previousGame