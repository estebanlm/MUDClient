testing
isRunning
	^ self session notNil and: [ self session isRunning ]