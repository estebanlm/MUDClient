"
I'm the panel for combat bar plugin. 
I show interesting combat stats in an easy to see way.

[Enemy Name]
[Health bar]
[Character  Name]
[Health bar]
[Movement bar]
[Force bar]
"
Class {
	#name : #LOTJCombatBarPanelMorph,
	#superclass : #Morph,
	#instVars : [
		'enemyLabel',
		'enemyBar',
		'characterLabel',
		'healthBar',
		'movementBar',
		'forceBar',
		'model'
	],
	#category : 'LOTJ-Plugin-CombatBar'
}

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> forceLabel [
	^ 'Force'
]

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> healthLabel [
	^ 'Health'
]

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> horizontalLabelWidth [
	^ 50
]

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> lineHeight [
	^ 18
]

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> movementLabel [
	^ 'Move'
]

{ #category : #accessing }
LOTJCombatBarPanelMorph class >> width [
	^ 225
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> buildCharacterPanel [
	^ self newVerticalPanel
		height: self class lineHeight * 4;
		addMorphBack: ((characterLabel := LabelMorph new) height: self class lineHeight);
		addMorphBack: (self buildHealthPanel height: self class lineHeight);
		addMorphBack: (self buildMovementPanel height: self class lineHeight);
		addMorphBack: (self buildForcePanel height: self class lineHeight);
		yourself
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> buildEnemyPanel [
	^ self newVerticalPanel
		height: self class lineHeight * 2;
		addMorphBack: ((enemyLabel := LabelMorph new) 
			clipSubmorphs: true; 
			height: self class lineHeight);
		addMorphBack: ((enemyBar := self newPercentBar) height: self class lineHeight);
		yourself
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> buildForcePanel [
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class forceLabel);
		addMorphBack: (forceBar := self newPercentBar);
		yourself
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> buildHealthPanel [
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class healthLabel);
		addMorphBack: (healthBar := self newPercentBar);
		yourself
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> buildMovementPanel [
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class movementLabel);
		addMorphBack: (movementBar := self newPercentBar);
		yourself
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> characterLabel [
	^ characterLabel
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> enemyBar [
	^ enemyBar
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> enemyLabel [
	^ enemyLabel
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> forceBar [
	^ forceBar
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> healthBar [
	^ healthBar
]

{ #category : #initialization }
LOTJCombatBarPanelMorph >> initialize [
	super initialize.
	self 
		color: (Smalltalk ui theme backgroundColor alpha: 0.6);
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		layoutInset: 10; 
		addMorphBack: self buildEnemyPanel;
		addMorphBack: self buildCharacterPanel;
		width: self class width;
		yourself.
		
	self height: (self submorphs sum: #height) + 20
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> movementBar [
	^ movementBar
]

{ #category : #accessing }
LOTJCombatBarPanelMorph >> movementBar: anObject [
	^ movementBar := anObject
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> newHorizontalLabel: aString [
	^ aString asStringMorph extent: (self class horizontalLabelWidth @ self class lineHeight)
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> newHorizontalPanel [
	^ Morph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #rigid;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		borderWidth: 0;
		clipSubmorphs: true;
		yourself	
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> newPercentBar [
	^ MUDPercentBarMorph new 
		borderWidth: 1;
		borderColor: Color transparent;
		height: self class lineHeight - 5;
		yourself
]

{ #category : #'private building' }
LOTJCombatBarPanelMorph >> newVerticalPanel [
	^ Morph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #rigid;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		borderWidth: 0;
		clipSubmorphs: true;
		yourself	
]
