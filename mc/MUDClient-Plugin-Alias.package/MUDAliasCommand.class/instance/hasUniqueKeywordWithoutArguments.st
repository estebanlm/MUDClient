testing
hasUniqueKeywordWithoutArguments
	^ self hasUniqueKeyword
		and: [ self keywords first hasArgument not ]