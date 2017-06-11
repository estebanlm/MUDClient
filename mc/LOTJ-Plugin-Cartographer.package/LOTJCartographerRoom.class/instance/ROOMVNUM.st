accessing variables
ROOMVNUM
	^ self valueAt: ROOM_VNUM ifAbsent: [ nil ]