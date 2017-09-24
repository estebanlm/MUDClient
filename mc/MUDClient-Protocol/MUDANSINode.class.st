"
I'm an ansi node. I keep ansi chunks of valid information (for example, a escape sequence or a simple text).
"
Class {
	#name : #MUDANSINode,
	#superclass : #Object,
	#category : 'MUDClient-Protocol-ANSI'
}

{ #category : #visitor }
MUDANSINode >> acceptCollector: aCollector [
	self subclassResponsibility
]

{ #category : #testing }
MUDANSINode >> isEscape [ 
	^ false 
]

{ #category : #testing }
MUDANSINode >> isText [ 
	^ self isEscape not
]

{ #category : #accessing }
MUDANSINode >> size [ 
	^ 0
]
