private
openCartographerFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(aTerminal dependentWindowsOf: plugin)
		ifNotEmpty: [ :windows |
			windows do: [ :each | 
				each window 
					activate;
					restore ] ]
		ifEmpty: [ 
			plugin activateOn: aTerminal.
			(LOTJCartographerBrowser game: aGame plugin: plugin) openOn: aTerminal ]