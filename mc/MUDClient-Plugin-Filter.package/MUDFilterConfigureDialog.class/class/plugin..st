instance creation
plugin: aPlugin
	^ self basicNew 
		initializePlugin: aPlugin;
		yourself