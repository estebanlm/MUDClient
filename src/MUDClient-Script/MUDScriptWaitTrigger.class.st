Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptWaitTrigger >> activate [
	super activate.
	self suspendProcess
]

{ #category : #accessing }
MUDScriptWaitTrigger >> deactivate [
	super deactivate.
	process ifNotNil: #resume

]

{ #category : #execute }
MUDScriptWaitTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #private }
MUDScriptWaitTrigger >> process [
	^ self script process
]

{ #category : #accessing }
MUDScriptWaitTrigger >> suspendProcess [
	self process suspend
]

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
