instance creation
decoration: aCharacter text: aString
	^ self basicNew 
		initializeDecoration: aCharacter text: aString;
		yourself