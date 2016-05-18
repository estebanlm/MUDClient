accessing
pluginAt: aGame ifAbsentPut: aBlock
	^ aGame 
		pluginByClass: self pluginClass  
		ifAbsent: [ aGame addPlugin: aBlock value ]