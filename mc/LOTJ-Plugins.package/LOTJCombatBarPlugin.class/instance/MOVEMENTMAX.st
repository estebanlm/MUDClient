accessing variables
MOVEMENTMAX
	^ self 
		valueAt: MOVEMENT_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]