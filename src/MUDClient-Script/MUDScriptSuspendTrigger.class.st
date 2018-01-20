"
I'm a trigger that can stop/continue the flow.
"
Class {
	#name : #MUDScriptSuspendTrigger,
	#superclass : #MUDScriptTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptSuspendTrigger >> activate [
	super activate.
	self suspendProcess
]

{ #category : #accessing }
MUDScriptSuspendTrigger >> deactivate [
	super deactivate.
	self resumeProcess
]

{ #category : #execute }
MUDScriptSuspendTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #execute }
MUDScriptSuspendTrigger >> resumeProcess [
	self evaluator continue
]

{ #category : #execute }
MUDScriptSuspendTrigger >> suspendProcess [
	self evaluator stop
]
