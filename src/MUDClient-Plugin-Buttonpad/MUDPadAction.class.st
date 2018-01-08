"
I'm a special kind of action. 
I can change my title and I also con have a right action.
"
Class {
	#name : #MUDPadAction,
	#superclass : #GLMGenericAction,
	#instVars : [
		'help',
		'actions'
	],
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #accessing }
MUDPadAction >> addAction: anAction [
	actions add: anAction
]

{ #category : #accessing }
MUDPadAction >> allActions [
	^ actions
]

{ #category : #accessing }
MUDPadAction >> help [
	^ help ifNil: [ self title ]
]

{ #category : #accessing }
MUDPadAction >> help: aString [
	help := aString
]

{ #category : #'initialize-release' }
MUDPadAction >> initialize [
	super initialize.
	actions := OrderedCollection new
]

{ #category : #accessing }
MUDPadAction >> title [ 
	^ super title value
]
