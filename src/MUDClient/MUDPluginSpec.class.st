"
I define the spec of a plugin. 
I define when it has toolbar, settings, etc. 
I define how this plugins will behave within a game.
"
Class {
	#name : #MUDPluginSpec,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'MUDClient-Model-Plugin'
}

{ #category : #accessing }
MUDPluginSpec class >> allExplicitActivationSpecs [
	^ self allSpecs select: #needsExplicitActivation
]

{ #category : #accessing }
MUDPluginSpec class >> allSpecs [
	^ self allSubclasses 
		reject: #isAbstract
		thenCollect: #uniqueInstance
]

{ #category : #testing }
MUDPluginSpec class >> isAbstract [ 
	^ self = MUDPluginSpec
]

{ #category : #'instance creation' }
MUDPluginSpec class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
MUDPluginSpec class >> uniqueInstance [ 	
	self = MUDPluginSpec 
		ifTrue: [ self error: 'I''m an abstract class. Use one of my children instead.' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #testing }
MUDPluginSpec >> hasToolbarSpec [
	^ self toolbarSpec notNil
]

{ #category : #testing }
MUDPluginSpec >> isVisibleFor: aTerminal [ 
	"by default, plugins are game dependent (they can be executed just when a game is active). 
	 User can modify it, but is about him :)"
	^ aTerminal hasGame
]

{ #category : #accessing }
MUDPluginSpec >> name [
	^ self subclassResponsibility
]

{ #category : #testing }
MUDPluginSpec >> needsExplicitActivation [
	"check if this plugin needs to be activated in game settings (normally, if there is not an 
	 option to start it from terminal)"
	^ self hasToolbarSpec not
]

{ #category : #accessing }
MUDPluginSpec >> pluginAt: aGame [
	^ self pluginAt: aGame ifAbsentPut: [ self pluginClass new ]
]

{ #category : #accessing }
MUDPluginSpec >> pluginAt: aGame ifAbsent: aBlock [
	^ aGame 
		pluginByClass: self pluginClass  
		ifAbsent: aBlock
]

{ #category : #accessing }
MUDPluginSpec >> pluginAt: aGame ifAbsentPut: aBlock [
	^ aGame 
		pluginByClass: self pluginClass  
		ifAbsent: [ aGame addPlugin: aBlock value ]
]

{ #category : #accessing }
MUDPluginSpec >> pluginClass [
	^ self subclassResponsibility
]

{ #category : #'accessing spec' }
MUDPluginSpec >> settingsSpec [
	^ MUDPluginSettingsSpec new 
		remember;
		yourself
]

{ #category : #'accessing spec' }
MUDPluginSpec >> toolbarSpec [
	"answers a toolbar spec or nil if plugin will now appear in terminal toolbar."
	^ nil
]
