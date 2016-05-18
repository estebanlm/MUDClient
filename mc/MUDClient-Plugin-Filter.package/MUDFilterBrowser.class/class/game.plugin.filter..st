instance creation
game: aGame plugin: aPlugin filter: aFilter
	^ self basicNew 
		initializeGame: aGame plugin: aPlugin filter: aFilter;
		yourself