accessing
send: aString toWindows: aCollection 
	aCollection do: [ :w | w send: aString ]