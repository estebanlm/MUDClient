Class {
	#name : #MUDScriptControlTrigger,
	#superclass : #MUDScriptTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptControlTrigger >> activate [
	super activate.
	self suspendProcess
]

{ #category : #accessing }
MUDScriptControlTrigger >> deactivate [
	super deactivate.
	self resumeProcess
]

{ #category : #execute }
MUDScriptControlTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #execute }
MUDScriptControlTrigger >> resumeProcess [
	self script continue
]

{ #category : #execute }
MUDScriptControlTrigger >> suspendProcess [
	self script stop
]
