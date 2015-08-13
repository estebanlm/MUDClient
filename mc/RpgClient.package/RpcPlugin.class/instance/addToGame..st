private
addToGame: aGame
	^ aGame 
		pluginByClass: self pluginClass
		ifAbsent: [ aGame addPlugin: self pluginClass new ]		
