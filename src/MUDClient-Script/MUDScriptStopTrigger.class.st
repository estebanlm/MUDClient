Class {
	#name : #MUDScriptStopTrigger,
	#superclass : #MUDScriptTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptStopTrigger >> activate [
	super activate.
	self suspendProcess
]

{ #category : #accessing }
MUDScriptStopTrigger >> deactivate [
	super deactivate.
	self resumeProcess
]

{ #category : #execute }
MUDScriptStopTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #execute }
MUDScriptStopTrigger >> resumeProcess [
	self script continue
]

{ #category : #execute }
MUDScriptStopTrigger >> suspendProcess [
	self script stop
]
