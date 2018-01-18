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
				table := a fastTable. 
				self description do: [ :each |
					table column: each label evaluated: [ :item | item readUsing: each ] ] ] ]
]

{ #category : #accessing }
MUDScriptCollectionBrowser >> description [
	^ self collection anyOne magritteDescription
]

{ #category : #initialization }
MUDScriptCollectionBrowser >> initializeCollection: aCollection [
	collection := aCollection.
	self initialize
]

{ #category : #showing }
MUDScriptCollectionBrowser >> open [
	self openOn: self collection
]
