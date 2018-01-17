Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptTrigger,
	#instVars : [
		'process'
	],
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
	process resume

]

{ #category : #accessing }
MUDScriptWaitTrigger >> destroy [
	process terminate
]

{ #category : #execute }
MUDScriptWaitTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]

{ #category : #accessing }
MUDScriptWaitTrigger >> suspendProcess [
	process := Processor activeProcess.
	process suspend.
]

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
