filtering
filterOn: aTerminal input: aString
	| filteredString |
	
	"First we filter variables (in case there are), then we go for complex aliases"
	filteredString := self filterVariables: aString.
	"Then filter aliases to obtain expanded command"
	filteredString := self filterAliases: filteredString.
	"And re-pass variables in case I put some in the alias."
	filteredString := self filterVariables: filteredString.
		
	^ filteredString