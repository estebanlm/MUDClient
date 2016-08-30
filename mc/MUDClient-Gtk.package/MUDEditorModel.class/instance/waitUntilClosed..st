private
waitUntilClosed: aWindow
	[ aWindow isVisible ]
		whileTrue: [ World doOneCycle ].