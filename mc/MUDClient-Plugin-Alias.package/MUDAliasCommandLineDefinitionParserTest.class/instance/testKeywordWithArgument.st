tests
testKeywordWithArgument
	self parse: 'reparmpr $arg1' rule: #keywordWithArgument.	
	self fail: 'reparmpr' rule: #keywordWithArgument.
	self fail: 'reparmpr arg1' rule: #keywordWithArgument