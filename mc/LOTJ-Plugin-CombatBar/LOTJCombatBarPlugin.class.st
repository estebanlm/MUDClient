"
I'm a combat bar plugin.
I receive different information from a character and open a combat panel when character is in a fight.

I know a character is in a fight because I receive OPPONENT_NAME tick who changes from empty to a name (not optimal, but is the only information I can take).

I show enemy health and character health, movement and force (if exists), other elements could join later.
"
Class {
	#name : #LOTJCombatBarPlugin,
	#superclass : #MUDPlugin,
	#traits : 'TMUDValueContainer',
	#classTraits : 'TMUDValueContainer classTrait',
	#instVars : [
		'values'
	],
	#classVars : [
		'CombatBarPanel'
	],
	#pools : [
		'LOTJMSDPVariables',
		'MUDTelnetConstantsMSDP'
	],
	#category : 'LOTJ-Plugin-CombatBar'
}

{ #category : #accessing }
LOTJCombatBarPlugin class >> stonAllInstVarNames [
	^ #()
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> CHARACTERNAME [
	^ self valueAt: CHARACTER_NAME ifAbsent: [ nil ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> HEALTH [
	^ self 
		valueAt: HEALTH 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> HEALTHMAX [
	^ self 
		valueAt: HEALTH_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> MANA [
	^ self 
		valueAt: MANA 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> MANAMAX [
	^ self 
		valueAt: MANA_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> MOVEMENT [
	^ self 
		valueAt: MOVEMENT 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> MOVEMENTMAX [
	^ self 
		valueAt: MOVEMENT_MAX 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> OPPONENTHEALTH [
	^ self 
		valueAt: OPPONENT_HEALTH 
		ifPresent: [ :value | value asInteger ]
		ifAbsent: [ 0 ]
]

{ #category : #'accessing variables' }
LOTJCombatBarPlugin >> OPPONENTNAME [
	^ self valueAt: OPPONENT_NAME ifAbsent: [ nil ]
]

{ #category : #testing }
LOTJCombatBarPlugin >> acceptsProcotolCommand: aCommand [
	^ (self reportVariables includes: aCommand variable variableName)
		or: [ aCommand variable variableName = SERVER_ID ]
]

{ #category : #private }
LOTJCombatBarPlugin >> activateOn: aTerminal [
	"Send reportable variables"
	(MUDServerMSDPReportCommand on: aTerminal)
		variables: self reportVariables;
		execute
]

{ #category : #private }
LOTJCombatBarPlugin >> createPanel [
	| newPanel |
	
	newPanel := LOTJCombatBarPanelMorph new.
	newPanel enemyLabel model: self; getTextSelector: #OPPONENTNAME.
	newPanel enemyBar model: self; getValueSelector: #OPPONENTHEALTH.
	newPanel characterLabel model: self; getTextSelector: #CHARACTERNAME.
	newPanel healthBar model: self; getValueSelector: #HEALTH; getMaxSelector: #HEALTHMAX.
	newPanel movementBar model: self; getValueSelector: #MOVEMENT; getMaxSelector: #MOVEMENTMAX.
	newPanel forceBar model: self; getValueSelector: #MANA; getMaxSelector: #MANAMAX.
	
	^ newPanel
]

{ #category : #testing }
LOTJCombatBarPlugin >> isProcessingProtocol: protocolId [
	^ protocolId == MSDP
]

{ #category : #'command processing' }
LOTJCombatBarPlugin >> processOn: aTerminal command: aCommand [
	| varName varValue |
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	self valueAt: varName put: varValue.
	varName = OPPONENT_NAME
		ifTrue: [ self togglePanelVisibilityOn: aTerminal ].
	[ self changed: varName asSymbol ] executeOnUIThread
]

{ #category : #accessing }
LOTJCombatBarPlugin >> reportVariables [ 
	^ {
	CHARACTER_NAME.
	HEALTH.
	HEALTH_MAX.
	MANA.
	MANA_MAX.
	MOVEMENT.
	MOVEMENT_MAX.
	OPPONENT_NAME.
	OPPONENT_HEALTH.
	MAX_AMMO.
	CURRENT_AMMO }
]

{ #category : #private }
LOTJCombatBarPlugin >> togglePanelVisibilityOn: aTerminal [
	self OPPONENTNAME isEmptyOrNil 
		ifTrue: [ 
			CombatBarPanel ifNotNil: [ 
				aTerminal areaMorph removeMorph: CombatBarPanel.
				CombatBarPanel := nil ].
			^ self ].
	
	CombatBarPanel ifNotNil: [ ^ self ]. "Do not add it double"
	CombatBarPanel := self createPanel.
	aTerminal areaMorph addMorph: CombatBarPanel position: #bottomRight.
	
]

{ #category : #accessing }
LOTJCombatBarPlugin >> values [
	^ values ifNil: [ 
		values := Dictionary withAll: (self reportVariables collect: [ :each | each -> nil ] ) ]
]
