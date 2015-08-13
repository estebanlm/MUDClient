accessing
title 
	^ self hasGame 
		ifTrue: [ 'Playing: ', self game name ]
		ifFalse: [ ^ super title ]