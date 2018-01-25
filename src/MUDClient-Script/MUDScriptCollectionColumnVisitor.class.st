Class {
	#name : #MUDScriptCollectionColumnVisitor,
	#superclass : #MAVisitor,
	#instVars : [
		'column'
	],
	#category : #'MUDClient-Script-View-Utils'
}

{ #category : #accessing }
MUDScriptCollectionColumnVisitor >> column [
	^ column
]

{ #category : #initialization }
MUDScriptCollectionColumnVisitor >> initialize [
	super initialize.
	column := GLMTableColumn new.
]

{ #category : #'visiting-description' }
MUDScriptCollectionColumnVisitor >> visitDescription: aDescription [
	column 
		title: aDescription label;
		computation: [ :item | item readUsing: aDescription ]
]

{ #category : #'visiting-description' }
MUDScriptCollectionColumnVisitor >> visitNumberDescription: aDescription [
	super visitElementDescription: aDescription.
	column width: 100. 

]
