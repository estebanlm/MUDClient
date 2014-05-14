accessing
first
	elements ifEmpty: [ ^ nil ].
	currentIndex := 1.
	^ self current