Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptSuspendTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
