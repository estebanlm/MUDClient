execute
executeAndWait
	^ Continuation currentDo: [ :cc | 
		self onAnswer: [ :v | cc value: v ].
		self execute ].