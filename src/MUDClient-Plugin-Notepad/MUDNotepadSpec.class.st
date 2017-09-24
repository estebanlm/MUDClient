Class {
	#name : #MUDNotepadSpec,
	#superclass : #MUDPluginSpec,
	#instVars : [
		'root'
	],
	#category : 'MUDClient-Plugin-Notepad-Model'
}

{ #category : #accessing }
MUDNotepadSpec >> name [
	^ 'Notepad'
]

{ #category : #private }
MUDNotepadSpec >> openNotepadFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDNotepadBrowser game: aGame plugin: plugin) openOn: aTerminal
]

{ #category : #accessing }
MUDNotepadSpec >> pluginClass [
	^ MUDNotepadPlugin
]

{ #category : #'accessing spec' }
MUDNotepadSpec >> settingsSpec [ 
	^ MUDPluginSettingsSpec new 
		forget;
		yourself
]

{ #category : #'accessing spec' }
MUDNotepadSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self openNotepadFor: aGame in: aTerminal ] 
		icon: #notepad asMUDIcon
		entitled: self name
]
