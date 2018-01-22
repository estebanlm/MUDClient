Class {
	#name : #MUDScriptCollectionBrowser,
	#superclass : #GLMCompositePresentation,
	#instVars : [
		'collection'
	],
	#category : #'MUDClient-Script-View-Utils'
}

{ #category : #'instance creation' }
MUDScriptCollectionBrowser class >> for: aCollection [
	^ self basicNew
		initializeCollection: aCollection;
		yourself
]

{ #category : #'instance creation' }
MUDScriptCollectionBrowser class >> new [ 
	self error: 'Use #for:'
]

{ #category : #accessing }
MUDScriptCollectionBrowser >> collection [
	^ collection
]

{ #category : #building }
MUDScriptCollectionBrowser >> compose [
	self tabulator with: [ :browser |
		browser row: #items.
		
		browser transmit 
			to: #items;
			andShow: [ :a | | table |
				(table := a fastTable)
					title: 'Items';
					act: [ :p :list | list inspect ] 
						icon: #glamorousInspect asIcon 
						entitled: 'Inspect';
					selectionAct: [ :p | Clipboard clipboardText: p selection asString ] 
						on: $c 
						entitled: 'Copy'.
				self description do: [ :each |
					table column: each label evaluated: [ :item | item readUsing: each ] ].
				table dynamicActionsOnSelection: [ :presentation | 
					self dynamicActionsOf: presentation selection ].
				self hasFilter ifTrue: [ 
					table enableFilter: [ :each :pattern | each matches: pattern ] ] ] ]
]

{ #category : #accessing }
MUDScriptCollectionBrowser >> description [
	^ self collection anyOne magritteDescription
]

{ #category : #private }
MUDScriptCollectionBrowser >> dynamicActionsOf: item [
	| pragmas |
	
	pragmas := Pragma allNamed: #selectionAction: from: item class to: Object.
	^ pragmas collect: [ :each | 
		TkAction new
			title: (each argumentAt: 1);
			action: [ each method valueWithReceiver: item arguments: #() ];
			yourself ]
	
	 
]

{ #category : #testing }
MUDScriptCollectionBrowser >> hasFilter [
	^ self collection anyOne respondsTo: #matches:
]

{ #category : #initialization }
MUDScriptCollectionBrowser >> initialize [
	super initialize.
	self title: self description label
]

{ #category : #initialization }
MUDScriptCollectionBrowser >> initializeCollection: aCollection [
	collection := aCollection asOrderedCollection.
	self initialize
]

{ #category : #showing }
MUDScriptCollectionBrowser >> open [
	self openOn: self collection
]
