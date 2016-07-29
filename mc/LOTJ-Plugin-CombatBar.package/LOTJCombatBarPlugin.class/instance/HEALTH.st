accessing variables
HEALTH
	^ self 
		valueAt: HEALTH 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]