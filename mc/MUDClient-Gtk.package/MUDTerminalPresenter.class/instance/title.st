accessing
title 
	^ self hasGame 
		ifTrue: [ 'Playing: ', self game name ]
		ifFalse: [ self class defaultTitle ]