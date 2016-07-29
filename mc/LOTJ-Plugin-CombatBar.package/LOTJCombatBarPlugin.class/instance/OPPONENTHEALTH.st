accessing variables
OPPONENTHEALTH
	^ self 
		valueAt: OPPONENT_HEALTH 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]