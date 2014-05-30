accessing
add: aString 
	elements addLast: aString.
	(elements size > self maxSize)
		ifTrue: [ elements removeFirst: (elements size - self maxSize) ].
	currentIndex := elements size