"
I'm the spec for the cartographer plugin.
"
Class {
	#name : #LOTJCartographerPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerPluginSpec >> name [
	^ 'LOTJ Cartographer'
]

{ #category : #private }
LOTJCartographerPluginSpec >> openCartographerFor: aGame in: aTerminal [
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
]

{ #category : #accessing }
LOTJCartographerPluginSpec >> pluginClass [
	^ LOTJCartographerPlugin
]

{ #category : #'accessing spec' }
LOTJCartographerPluginSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openCartographerFor: aGame in: aTerminal ]
		icon: #map1 asMUDIcon
		entitled: self name
]
