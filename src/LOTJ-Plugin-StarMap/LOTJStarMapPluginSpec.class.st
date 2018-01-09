"
I'm the spec for the LOTJ starmap plugin.
"
Class {
	#name : #LOTJStarMapPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : #'LOTJ-Plugin-StarMap-Model'
}

{ #category : #accessing }
LOTJStarMapPluginSpec >> name [
	^ 'LOTJ Star Map'
]

{ #category : #private }
LOTJStarMapPluginSpec >> openStarMapFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(LOTJStarMapBrowser game: aGame plugin: plugin) openOn: aTerminal
]

{ #category : #accessing }
LOTJStarMapPluginSpec >> pluginClass [
	^ LOTJStarMapPlugin
]

{ #category : #'accessing spec' }
LOTJStarMapPluginSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openStarMapFor: aGame in: aTerminal ]
		icon: #map2 asMUDIcon
		entitled: self name
]
