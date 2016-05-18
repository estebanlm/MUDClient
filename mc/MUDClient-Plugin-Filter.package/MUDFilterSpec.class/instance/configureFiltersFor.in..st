private
configureFiltersFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDFilterConfigureDialog plugin: plugin) 
		onLaunch: [ :filter | 
			(MUDFilterBrowser 
				game: aGame 
				plugin: plugin 
				filter: filter) 
				openOn: aTerminal ];  
		go