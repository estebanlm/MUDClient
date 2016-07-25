filtering
filterOn: aTerminal input: aString
	| filteredString |
	"First we filter variables (in case there are), then we go for complex aliases"
	filteredString := self filterVariables: aString.
	^ self filterAliases: filteredString