Class {
	#name : #MUDAliasCommandLineKeyword,
	#superclass : #Object,
	#instVars : [
		'value',
		'argument'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #accessing }
MUDAliasCommandLineKeyword >> argument [
	^ argument
]

{ #category : #accessing }
MUDAliasCommandLineKeyword >> argument: anObject [
	argument := anObject
]

{ #category : #printing }
MUDAliasCommandLineKeyword >> printOn: stream [ 
	stream 
		<< self value 
		<< '('; print: (self argument ifNil: [ '' ]); << ')'
]

{ #category : #accessing }
MUDAliasCommandLineKeyword >> value [
	^ value
]

{ #category : #accessing }
MUDAliasCommandLineKeyword >> value: anObject [
	value := anObject
]
