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
	self continue
]

{ #category : #execute }
MUDScriptWaitTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #private }
MUDScriptWaitTrigger >> process [
	^ self script process
]

{ #category : #execute }
MUDScriptWaitTrigger >> resumeProcess [
	self script continue
]

{ #category : #execute }
MUDScriptWaitTrigger >> suspendProcess [
	self script stop
]

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
