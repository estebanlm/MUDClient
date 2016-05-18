private
openNotepadFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDNotepadBrowser game: aGame plugin: plugin) openOn: aTerminal