Class {
	#name : #MUDScriptPipeLineCountStrategy,
	#superclass : #MUDScriptPipeStrategy,
	#instVars : [
		'matched'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #testing }
MUDScriptPipeLineCountStrategy class >> isAvailableFor: aTrigger [
	^ aTrigger isLineCounting
]

{ #category : #accessing }
MUDScriptPipeLineCountStrategy >> evaluateWith: aString ifMatches: aBlock [
	self outStream << aString << String cr.
	self outStream contents lines size >= self lines
		ifTrue: [ ^ self trigger triggerMatchedThen: aBlock ]
]

{ #category : #initialization }
MUDScriptPipeLineCountStrategy >> initialize [
	super initialize.
	matched := false
]

{ #category : #accessing }
MUDScriptPipeLineCountStrategy >> lines [
	^ self trigger lines
]
