testing
isVisibleFor: aTerminal 
	"by default, plugins are game dependent (they can be executed just when a game is active). 
	 User can modify it, but is about him :)"
	^ aTerminal hasGame