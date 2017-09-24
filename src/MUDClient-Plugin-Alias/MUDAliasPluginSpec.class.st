"
I'm the spec for the alias plugin.
"
Class {
	#name : #MUDAliasPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #private }
MUDAliasPluginSpec >> configureAliasesFor: aGame in: aTerminal [
	| plugin |
	plugin := self pluginAt: aGame.
	(MUDAliasBrowser game: aGame plugin: plugin)
		openOn: aTerminal
]

{ #category : #accessing }
MUDAliasPluginSpec >> name [
	^ 'Alias'
]

{ #category : #accessing }
MUDAliasPluginSpec >> pluginClass [
	^ MUDAliasPlugin
]

{ #category : #accessing }
MUDAliasPluginSpec >> toolbarSpec [ 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self configureAliasesFor: aGame in: aTerminal ]
		icon: #alias asMUDIcon
		entitled: self name
]
