"
I'm the spec for the combat bar plugin.
"
Class {
	#name : #LOTJCombatBarPluginSpec,
	#superclass : #MUDPluginSpec,
	#category : 'LOTJ-Plugin-CombatBar'
}

{ #category : #accessing }
LOTJCombatBarPluginSpec >> name [
	^ 'LOTJ Combat Bar'
]

{ #category : #accessing }
LOTJCombatBarPluginSpec >> pluginClass [
	^ LOTJCombatBarPlugin
]
