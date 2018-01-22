Class {
	#name : #MUDScriptPipeDefaultStrategy,
	#superclass : #MUDScriptPipeStrategy,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeDefaultStrategy >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self trigger triggerMatchedThen: aBlock]
		ifFalse: [ self outStream << aString << String cr ]
]
