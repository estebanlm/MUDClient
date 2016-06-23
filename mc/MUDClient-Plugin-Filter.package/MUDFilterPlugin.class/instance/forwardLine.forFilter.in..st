private
forwardLine: line forFilter: aFilter in: aTerminal
	(aTerminal dependentWindowsOf: self)
		select: [ :each | each filter = aFilter ] 
		thenDo: [ :each | each send: line ]	