Class {
	#name : #MUDPluginSettingsSpec,
	#superclass : #Object,
	#instVars : [
		'remember'
	],
	#category : 'MUDClient-Model-Plugin'
}

{ #category : #accessing }
MUDPluginSettingsSpec >> forget [
	remember := false
]

{ #category : #initialization }
MUDPluginSettingsSpec >> initialize [
	super initialize.
	self forget
]

{ #category : #testing }
MUDPluginSettingsSpec >> isRemembered [
	^ remember
]

{ #category : #accessing }
MUDPluginSettingsSpec >> remember [
	remember := true
]
