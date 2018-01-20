"
I'm the spec for the script plugin.
"
Class {
	#name : #MUDScriptPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPluginSpec >> name [
	^ 'Scripting'
]

{ #category : #accessing }
MUDScriptPluginSpec >> openScriptpadFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDScriptBrowser game: aGame plugin: plugin) openOn: aTerminal
]

{ #category : #accessing }
MUDScriptPluginSpec >> pluginClass [
	^ MUDScriptPlugin
]

{ #category : #accessing }
MUDScriptPluginSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openScriptpadFor: aGame in: aTerminal ]
		icon: #edit asMUDIcon
		entitled: self name
]
