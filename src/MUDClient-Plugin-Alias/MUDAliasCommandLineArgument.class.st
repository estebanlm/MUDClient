Class {
	#name : #MUDAliasCommandLineArgument,
	#superclass : #Object,
	#instVars : [
		'value',
		'quantity'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #printing }
MUDAliasCommandLineArgument >> printOn: stream [ 
	self quantity 
		ifNotNil: [ stream << self quantity << ' ' ].
	stream << self value
]

{ #category : #accessing }
MUDAliasCommandLineArgument >> quantity [
	^ quantity
]

{ #category : #accessing }
MUDAliasCommandLineArgument >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
MUDAliasCommandLineArgument >> value [
	^ value
]

{ #category : #accessing }
MUDAliasCommandLineArgument >> value: anObject [
	value := anObject
]
