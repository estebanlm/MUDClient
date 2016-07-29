accessing variables
HEALTHMAX
	^ self 
		valueAt: HEALTH_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]