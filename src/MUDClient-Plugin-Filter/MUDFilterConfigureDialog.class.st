"
I'm a configuration dialog for filters. 
"
Class {
	#name : #MUDFilterConfigureDialog,
	#superclass : #TkGlamourSelectingEditor,
	#instVars : [
		'plugin',
		'launchAction',
		'filterClass'
	],
	#category : #'MUDClient-Plugin-Filter-View'
}

{ #category : #'instance creation' }
MUDFilterConfigureDialog class >> plugin: aPlugin [
	^ self basicNew 
		initializePlugin: aPlugin;
		yourself
]

{ #category : #accessing }
MUDFilterConfigureDialog class >> preferredExtent [ 
	^ 600@350
]

{ #category : #accessing }
MUDFilterConfigureDialog class >> title [
	^ 'Filters Configuration'
]

{ #category : #actions }
MUDFilterConfigureDialog >> accepted: anObject [
	
]

{ #category : #actions }
MUDFilterConfigureDialog >> addObjectThen: aBlock [
	| filter |
	
	filter := (TkMagritteEditor object: self filterClass new) go.
	filter ifNil: [ ^ self ].
	self plugin addFilter: filter. 
	aBlock cull: filter
]

{ #category : #building }
MUDFilterConfigureDialog >> addObjectsMenuOn: aList [
	aList 
		strongSelectionAct: [ :p | self launch: p selection ];
		act: [ :p | self addObjectThen: [ p update ] ] 
			icon: #add asMUDIcon 
			entitled: 'New Filter';
		selectionAct: [ :p | self launch: p selection ] 
			entitled: 'Launch'
			when: [ :p | p selection notNil and: [ p selection isAlert not ]];
		selectionAct: [ :p | self removeObject: p selection then: [ p update ]] 
			entitled: 'Remove' 
	"aPresentation 
		selectionAct: [ :list | 
				self 
					moveUp: list selection
					then: [ list update ] ] 
			entitled: 'Move up' 
			when: [ :list | self filters notEmpty and: [ self filters first ~= list selection ] ];
		selectionAct: [ :list | 
				self 
					moveDown: list selection
					then: [ list update ] ] 
			entitled: 'Move down' 
			when: [ :list | self filters notEmpty and: [ self filters last ~= list selection ] ]"
]

{ #category : #actions }
MUDFilterConfigureDialog >> basicRemoveObject: aPlugin [  
	self plugin removeFilter: aPlugin
]

{ #category : #building }
MUDFilterConfigureDialog >> buildBrowser [
	| browser |
	
	browser := GLMTabulator new 
		title: self title;
		initialExtent: self class preferredExtent;
		column: #objects;
		column: #currentObject span: 2;
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

{ #category : #private }
MUDFilterConfigureDialog >> descriptionFor: anObject [ 
	^ anObject name
]

{ #category : #accessing }
MUDFilterConfigureDialog >> filterClass [
	^ filterClass
]

{ #category : #accessing }
MUDFilterConfigureDialog >> filterClass: aClass [
	filterClass := aClass
]

{ #category : #accessing }
MUDFilterConfigureDialog >> filters [
	^ self plugin filters 
		select: [ :each | each class = self filterClass ]
]

{ #category : #initialization }
MUDFilterConfigureDialog >> initializePlugin: aPlugin [ 
	plugin := aPlugin.
	self initialize
	
]

{ #category : #actions }
MUDFilterConfigureDialog >> launch: aFilter [
	launchAction ifNil: [ ^ self ].
	aFilter activate.
	launchAction value: aFilter
]

{ #category : #accessing }
MUDFilterConfigureDialog >> list [ 
	^ self filters
]

{ #category : #accessing }
MUDFilterConfigureDialog >> listTitle [
	^ self filterClass label
]

{ #category : #actions }
MUDFilterConfigureDialog >> moveDown: anObject then: aBlock [
	self plugin moveFilterDown: anObject.
	aBlock value
]

{ #category : #actions }
MUDFilterConfigureDialog >> moveUp: anObject then: aBlock [ 
	self plugin moveFilterUp: anObject.
	aBlock value
]

{ #category : #accessing }
MUDFilterConfigureDialog >> objects [
	^ self filters
]

{ #category : #accessing }
MUDFilterConfigureDialog >> onLaunch: aBlock [
	launchAction := aBlock
]

{ #category : #accessing }
MUDFilterConfigureDialog >> plugin [
	^ plugin
]

{ #category : #accessing }
MUDFilterConfigureDialog >> preferredExtent [
	^ 800@((MUDAlertFilter basicNew magritteDescription tkHeight) + 200)
]

{ #category : #actions }
MUDFilterConfigureDialog >> removeObject: anObject then: aBlock [
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { anObject name }))
		ifFalse: [ ^ false ].
	self basicRemoveObject: anObject.
	aBlock value
]

{ #category : #accessing }
MUDFilterConfigureDialog >> title [ 
	^ 'Configure ', self listTitle asLowercase 
]
