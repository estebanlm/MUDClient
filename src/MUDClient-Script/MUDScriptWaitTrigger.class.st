Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptTrigger,
	#instVars : [
		'process'
	],
	#category : #'MUDClient-Script'
}

{ #category : #accessing }
MUDScriptWaitTrigger >> activate [
	super activate.
	process := Processor activeProcess.
	process suspend.
]

{ #category : #accessing }
MUDScriptWaitTrigger >> deactivate [
	super deactivate.
	process resume

]

{ #category : #execute }
MUDScriptWaitTrigger >> execute [ 
	"Do nothing, proecess will be resumed when deactivating"
]
