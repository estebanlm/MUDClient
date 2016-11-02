accessing
send: aString toWindows: aCollection 
	^ super 
		send: (self decoration decorate: aString)
		toWindows: aCollection