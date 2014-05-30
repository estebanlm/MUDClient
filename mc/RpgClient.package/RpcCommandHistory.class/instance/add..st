accessing
add: aString 
	elements addLast: aString.
	[ elements size > self maxSize ]
		whileTrue: [ elements removeFirst ].
	currentIndex := elements size