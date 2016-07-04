testing
hasUniqueKeywordWithoutArguments
	^ self hasUniqueKeyword
		and: [ self keywords first hasArguments not ]