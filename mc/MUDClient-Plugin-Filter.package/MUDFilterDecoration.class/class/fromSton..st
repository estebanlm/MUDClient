instance creation
fromSton: stonReader
	^ self uniqueInstance
		fromSton: stonReader;
		yourself