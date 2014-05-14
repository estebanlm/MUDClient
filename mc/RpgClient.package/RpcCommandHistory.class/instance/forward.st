accessing
forward 
	elements ifEmpty: [ ^ nil ].
	currentIndex = elements size ifTrue: [ ^ elements last ].
		
	currentIndex := currentIndex + 1.
	^ self current