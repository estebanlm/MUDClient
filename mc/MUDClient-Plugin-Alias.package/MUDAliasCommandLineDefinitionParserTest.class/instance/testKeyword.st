tests
testKeyword
	self parse: 'reparmpr' rule: #keyword.
	self fail: 'reparmpr $arg1' rule: #keyword.