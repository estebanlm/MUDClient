accessing
pluginAt: aGame ifAbsent: aBlock
	^ aGame 
		pluginByClass: self pluginClass  
		ifAbsent: aBlock