Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptStopTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
