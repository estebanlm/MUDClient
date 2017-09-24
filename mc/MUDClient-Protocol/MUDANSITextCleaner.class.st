"
I'm a visitor to clean the code of ANSI format.
"
Class {
	#name : #MUDANSITextCleaner,
	#superclass : #MUDANSIVisitor,
	#instVars : [
		'stream'
	],
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #accessing }
MUDANSITextCleaner class >> cleanText: aString [
	^ self visitAll: (MUDANSIParser default
		parse: aString 
		onError: [ ^ aString ])
]

{ #category : #accessing }
MUDANSITextCleaner >> contents [ 
	^ stream contents
]

{ #category : #visitor }
MUDANSITextCleaner >> visitAll: aCollection [ 
	stream := (String new: 200) writeStream.
	super visitAll: aCollection.
	^ self contents
]

{ #category : #visitor }
MUDANSITextCleaner >> visitText: aNode [
	stream << aNode text
]
