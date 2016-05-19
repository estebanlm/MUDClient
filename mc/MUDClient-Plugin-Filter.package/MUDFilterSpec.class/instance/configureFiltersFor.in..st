private
configureFiltersFor: aGame in: aTerminal
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDFilterConfigureDialog plugin: plugin)
		onLaunch: [ :filter | self openBrowserFor: aGame plugin: plugin filter: filter in: aTerminal ];
		go