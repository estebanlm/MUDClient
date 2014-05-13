private
dataSend: ann
	session isRunning ifFalse: [ ^ self ].
	session writeln: inputMorph text asString.
	inputMorph selectAll