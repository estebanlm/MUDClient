"
I'm a dialog (browser) to edit different aliases.
"
Class {
	#name : #MUDAliasBrowser,
	#superclass : #MUDPluginBrowser,
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #accessing }
MUDAliasBrowser class >> preferredExtent [ 
	^ 400@250
]

{ #category : #accessing }
MUDAliasBrowser class >> title [ 
	^ 'Alias'
]

{ #category : #building }
MUDAliasBrowser >> addAliasMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter | self addAliasThen: [ presenter update ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add alias...';
		selectionAct: [ :presenter | 
				self 
					removeAlias: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Remove'
]

{ #category : #actions }
MUDAliasBrowser >> addAliasThen: aBlock [
	| alias |
	
	alias := (TkMagritteEditor object: MUDAlias new) go.
	alias ifNil: [ ^ self ].
	self plugin addAlias: alias. 
	aBlock cull: alias
	
	
]

{ #category : #building }
MUDAliasBrowser >> addVariableMenuOn: aPresenter [
	aPresenter 
		act: [ :presenter | self addVariableThen: [ presenter update ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add global variable...';
		selectionAct: [ :presenter | 
				self 
					removeVariable: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Remove'
]

{ #category : #actions }
MUDAliasBrowser >> addVariableThen: aBlock [
	| variable |
	
	variable := (TkMagritteEditor object: MUDVariable new) go.
	variable ifNil: [ ^ self ].
	self plugin addVariable: variable. 
	aBlock cull: variable
	
]

{ #category : #accessing }
MUDAliasBrowser >> aliases [
	^ self plugin aliases sorted: [ :a :b | a name < b name ]
]

{ #category : #building }
MUDAliasBrowser >> buildContentsOn: composer [
	| browser |
	composer custom: (browser := GLMStacker new).
	browser 
		aPane: #aliases;
		aPane: #variables.
	browser transmit to: #aliases; andShow: [ :a | 
		a title: 'Aliases'.
		a custom: self createAliasBrowser ].
	browser transmit to: #variables; andShow: [ :a | 
		a title: 'Global Variables'.
		a custom: self createVariablesBrowser ]
]

{ #category : #building }
MUDAliasBrowser >> createAliasBrowser [
	| browser |
	
	browser := GLMTabulator new.
	browser
		column: #aliases;
		column: #alias span: 2.
		
	browser transmit 
		to: #aliases;
		andShow: [ :a | 
			a fastList
				title: 'Commands';
				in: [ :this | self addAliasMenuOn: this ];
				display: [ self aliases ];
				format: [ :alias | alias name ]].

	browser transmit 
		from: #aliases;
		to: #alias;
		andShow: [ :a | 
			a tkMagritte
				title: [ :alias | alias name ] ].
			
	^ browser
]

{ #category : #building }
MUDAliasBrowser >> createVariablesBrowser [
	| browser |
	
	browser := GLMTabulator new.
	browser
		column: #variables;
		column: #variable span: 2.
		
	browser transmit 
		to: #variables;
		andShow: [ :a | 
			a fastList
				title: 'Variables';
				in: [ :this | self addVariableMenuOn: this ];
				display: [ self variables ];
				format: [ :var | var name ]].

	browser transmit 
		from: #variables;
		to: #variable;
		andShow: [ :a | 
			a tkMagritte
				title: [ :var | var name ] ].
	^ browser
]

{ #category : #actions }
MUDAliasBrowser >> removeAlias: anAlias then: aBlock [
	(self confirm: ('Are you sure you want to remove alias {1}' format: { anAlias name }))
		ifFalse: [ ^ self ].
	self plugin removeAlias: anAlias. 
	aBlock value
	
]

{ #category : #actions }
MUDAliasBrowser >> removeVariable: aVariable then: aBlock [
	(self confirm: ('Are you sure you want to remove variable {1}' format: { aVariable name }))
		ifFalse: [ ^ self ].
	self plugin removeVariable: aVariable. 
	aBlock value
	
]

{ #category : #accessing }
MUDAliasBrowser >> variables [
	^ self plugin variables sorted: [ :a :b | a name < b name ]
]
