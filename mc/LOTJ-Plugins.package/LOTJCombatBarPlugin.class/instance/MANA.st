accessing variables
MANA
	^ self 
		valueAt: MANA 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]