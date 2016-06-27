accessing variables
MOVEMENT
	^ self 
		valueAt: MOVEMENT 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]