Class {
	#name : #MUDScriptSourceEvaluator,
	#superclass : #MUDScriptEvaluator,
	#category : #'MUDClient-Script-Model'
}

{ #category : #private }
MUDScriptSourceEvaluator >> actionWithArguments: anArray [
	^ Smalltalk compiler evaluate: (String streamContents: [ :stream |
		stream << '['.
		anArray ifNotEmpty: [ 
			anArray do: [ :each |
				stream << ':' << each << ' ' ].
			stream << '| ' ].
		stream << self script contents.
		stream << ']' ])
]
