accessing variables
OPPONENTNAME
	^ self valueAt: OPPONENT_NAME ifAbsent: [ nil ]