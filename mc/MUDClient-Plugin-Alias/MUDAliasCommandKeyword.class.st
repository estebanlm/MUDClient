Class {
	#name : #MUDAliasCommandKeyword,
	#superclass : #Object,
	#instVars : [
		'value',
		'argument'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #'instance creation' }
MUDAliasCommandKeyword class >> value: aString [ 
	^ self value: aString argument: nil
]

{ #category : #'instance creation' }
MUDAliasCommandKeyword class >> value: aString argument: argString [
	^ self new
		value: aString;
		argument: argString;
		yourself
]

{ #category : #accessing }
MUDAliasCommandKeyword >> argument [
	^ argument
]

{ #category : #accessing }
MUDAliasCommandKeyword >> argument: anObject [
	argument := anObject
]

{ #category : #testing }
MUDAliasCommandKeyword >> hasArgument [
	^ self argument notNil
]

{ #category : #accessing }
MUDAliasCommandKeyword >> value [
	^ value
]

{ #category : #accessing }
MUDAliasCommandKeyword >> value: anObject [
	value := anObject
]
