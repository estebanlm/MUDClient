private
openLogFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDLogViewerBrowser game: aGame plugin: plugin) openOn: aTerminal