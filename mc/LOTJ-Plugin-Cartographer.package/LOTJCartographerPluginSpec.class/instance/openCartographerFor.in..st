private
openCartographerFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	plugin activateOn: aTerminal.
	(LOTJCartographerBrowser game: aGame plugin: plugin) openOn: aTerminal