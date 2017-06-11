accessing variables
ROOMNAME
	^ self valueAt: ROOM_NAME ifAbsent: [ nil ]