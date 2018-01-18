Class {
	#name : #MUDScriptPipeLineCountStrategy,
	#superclass : #MUDScriptPipeStrategy,
	#instVars : [
		'matched'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeLineCountStrategy >> evaluateWith: aString ifMatches: aBlock [
	matched ifTrue: [ 
		self outStream << aString << String cr.
		self outStream contents lines >= self lines size
			ifTrue: [ ^ self trigger triggerMatchedThen: aBlock ] ].
	(matched := self matches: aString) 
		ifTrue: [ self triggerMatched: aString then: aBlock ]
]

{ #category : #initialization }
MUDScriptPipeLineCountStrategy >> initialize [
	super initialize.
	matched := false
]
