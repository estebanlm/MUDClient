"
I'm a game pick/create generator. 
I can be used to choose existing games or to create new ones. 
"
Class {
	#name : #MUDGameEditor,
	#superclass : #TkGlamourSelectingEditor,
	#category : 'MUDClient-View'
}

{ #category : #accessing }
MUDGameEditor class >> preferredExtent [ 
	^ 800@450
]

{ #category : #accessing }
MUDGameEditor class >> title [ 
	^ 'Games'
]

{ #category : #actions }
MUDGameEditor >> addObjectThen: aBlock [
	aBlock cull: ((MUDGame 
		name: 'New Game' 
		host: '' 
		port: 5555)
		save)
]

{ #category : #building }
MUDGameEditor >> addObjectsMenuOn: aList [
	aList 
		act: [ :p |
				self addObjectThen: [ :newObject | 
					p update. 
					p selection: newObject]]
			icon: #add asMUDIcon
			entitled: 'Add new';
		strongSelectionAct: [ :p | self launch: p selection ];
		selectionAct: [ :p | self launch: p selection ]
			entitled: 'Launch';
		selectionAct: [ :p | self duplicate: p selection then: [ p update ] ]
			entitled: 'Duplicate as...';
		selectionAct: [ :p | self removeObject: p selection then: [ p update ] ]
			entitled: 'Remove'
]

{ #category : #actions }
MUDGameEditor >> basicRemoveObject: anObject [	
	anObject remove
]

{ #category : #building }
MUDGameEditor >> buildBrowser [
	| browser |
	
	browser := GLMTabulator new 
		title: self class title;
		initialExtent: self preferredExtent;
		row: [ :row |
			row 
				column: #objects;
				column: #currentObject ];
		row: #actions size: 35;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].

	^ browser
]

{ #category : #factory }
MUDGameEditor >> createObject [ 
	^ super createObject save
]

{ #category : #actions }
MUDGameEditor >> duplicate: aGame then: aBlock [
	| newName |
	
	newName := UIManager default 
		request: 'Game name' 
		initialAnswer: aGame name 
		title: 'Name of the duplicated game'.
	newName isEmptyOrNil ifTrue: [ ^ self ].
	
	(aGame cloneAs: newName) save.
	aBlock value
]

{ #category : #actions }
MUDGameEditor >> launch: aGame [ 
	value := aGame. 
	window close
]

{ #category : #accessing }
MUDGameEditor >> list [ 
	^ self objects
]

{ #category : #accessing }
MUDGameEditor >> objects [
	^ MUDGame findAll sorted: [ :a :b | a name < b name ]
]

{ #category : #actions }
MUDGameEditor >> removeObject: anObject then: aBlock [
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { anObject name }))
		ifFalse: [ ^ false ].
	self basicRemoveObject: anObject.
	aBlock value
]
