accessing variables
ROOMEXITS
	^ self valueAt: ROOM_EXITS ifAbsent: [ nil ]