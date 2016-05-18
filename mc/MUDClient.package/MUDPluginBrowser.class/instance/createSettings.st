private settings
createSettings
	^ (MUDBrowserPluginSettings browserClass: self class game: self game)
		plugin: self plugin;
		yourself