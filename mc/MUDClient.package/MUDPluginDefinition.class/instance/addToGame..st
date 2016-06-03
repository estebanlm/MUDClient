private
addToGame: aGame
	^ aGame 
		pluginByClass: self pluginClass
		ifAbsent: [ 
			| newPlugin |
			newPlugin := self pluginClass new.
			aGame addPlugin: newPlugin.
			newPlugin ]		
