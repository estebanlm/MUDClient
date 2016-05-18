private
openButtonpadFor: aGame in: aTerminal
	| plugin window |
	plugin := self pluginAt: aGame.
	window := MUDPadBrowser game: aGame plugin: plugin. 
	window openOn: aTerminal