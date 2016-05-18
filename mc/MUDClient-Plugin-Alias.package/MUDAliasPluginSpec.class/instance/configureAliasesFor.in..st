private
configureAliasesFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDAliasBrowser game: aGame plugin: plugin)
		openOn: aTerminal