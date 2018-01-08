Class {
	#name : #MUDScriptPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : #'MUDClient-Script'
}

{ #category : #accessing }
MUDScriptPluginSpec >> name [
	^ 'Scripting'
]

{ #category : #accessing }
MUDScriptPluginSpec >> openScriptpadFor: aGame in: aTerminal [
	
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
