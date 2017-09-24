"
I parse ANSI commands to show them properly.
"
Class {
	#name : #MUDANSIDecoration,
	#superclass : #MUDParseDecoration,
	#instVars : [
		'formatter',
		'parser'
	],
	#category : 'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDANSIDecoration >> formatter [ 
	^ formatter ifNil: [ formatter := MUDANSITextFormatter new ]
]

{ #category : #parsing }
MUDANSIDecoration >> parse: aStringOrText [
	| ansiText |

	ansiText := self formatter visitAll: (self parser 
		parse: aStringOrText
		onError: [ ^ self parseNext: aStringOrText ]).
		
	^ self parseNext: ansiText
]

{ #category : #accessing }
MUDANSIDecoration >> parser [
	^ parser ifNil: [ parser := MUDANSIParser new ]
]
