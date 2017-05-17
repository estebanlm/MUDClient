private
openStarMapFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(LOTJStarMapBrowser game: aGame plugin: plugin) openOn: aTerminal