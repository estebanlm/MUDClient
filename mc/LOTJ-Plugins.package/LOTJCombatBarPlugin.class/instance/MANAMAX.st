accessing variables
MANAMAX
	^ self 
		valueAt: MANA_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]