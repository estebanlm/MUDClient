Class {
	#name : #MUDScriptWaitTrigger,
	#superclass : #MUDScriptControlTrigger,
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptWaitTrigger >> until: aString [
	patterns add: aString
]
