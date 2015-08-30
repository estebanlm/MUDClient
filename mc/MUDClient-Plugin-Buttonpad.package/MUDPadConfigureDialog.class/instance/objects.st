accessing
objects
	^ objects ifNil: [ objects := self createObjects ]