accessing variables
CHARACTERNAME
	^ self valueAt: CHARACTER_NAME ifAbsent: [ nil ]