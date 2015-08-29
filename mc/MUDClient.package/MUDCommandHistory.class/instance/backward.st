accessing
backward
	elements ifEmpty: [ ^ nil ].
	currentIndex = 1 ifTrue: [ ^ elements first ].
		
	currentIndex := currentIndex - 1.
	^ self current