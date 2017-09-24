Class {
	#name : #MUDPadPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : 'MUDClient-Plugin-Buttonpad-Model'
}

{ #category : #accessing }
MUDPadPluginSpec >> name [
	^ 'Button Pad'
]

{ #category : #private }
MUDPadPluginSpec >> openButtonpadFor: aGame in: aTerminal [
	| plugin window |
	plugin := self pluginAt: aGame.
	window := MUDPadBrowser game: aGame plugin: plugin. 
	window openOn: aTerminal
]

{ #category : #accessing }
MUDPadPluginSpec >> pluginClass [
	^ MUDPadPlugin
]

{ #category : #accessing }
MUDPadPluginSpec >> toolbarSpec [
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openButtonpadFor: aGame in: aTerminal ] 
		icon: #pad asMUDIcon
		entitled: self name
]
