testing
isActiveOn: aTerminal
	"Filter plugin can just be active if there are filters AND the filter browser is open"
	^ self hasFilters 
		and: [ aTerminal hasDependentWindowOf: self ]