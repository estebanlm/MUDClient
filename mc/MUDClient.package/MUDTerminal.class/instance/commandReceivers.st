private session
commandReceivers
	^ commandReceivers ifNil: [ commandReceivers := OrderedCollection new ]