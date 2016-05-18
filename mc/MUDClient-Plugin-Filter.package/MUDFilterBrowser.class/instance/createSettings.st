private settings
createSettings
	^ (MUDFilterBrowserSettings browserClass: self class game: self game)
		plugin: self plugin;
		filter: self filter;
		yourself