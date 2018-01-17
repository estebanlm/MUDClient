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
	process := Processor activeProcess.
	process suspend.
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

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
