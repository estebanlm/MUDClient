Class {
	#name : #MUDLogViewerSpec,
	#superclass : #MUDPluginSpec,
	#category : 'MUDClient-Plugin-LogViewer-View'
}

{ #category : #accessing }
MUDLogViewerSpec >> name [
	^ 'Log Viewer'
]

{ #category : #private }
MUDLogViewerSpec >> openLogFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDLogViewerBrowser game: aGame plugin: plugin) openOn: aTerminal
]

{ #category : #accessing }
MUDLogViewerSpec >> pluginClass [ 
	^ MUDLogViewerPlugin
]

{ #category : #'accessing spec' }
MUDLogViewerSpec >> settingsSpec [ 
	^ MUDPluginSettingsSpec new 
		forget;
		yourself
]

{ #category : #'accessing spec' }
MUDLogViewerSpec >> toolbarSpec [
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self openLogFor: aGame in: aTerminal ]
		icon: #logViewer asMUDIcon
		entitled: self name
]
