Class {
	#name : #MUDAliasCommandLine,
	#superclass : #Object,
	#instVars : [
		'keywords',
		'rawLine'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #'instance creation' }
MUDAliasCommandLine class >> keywords: anArray [
	^ self new keywords: anArray
]

{ #category : #accessing }
MUDAliasCommandLine >> keywords [
	^ keywords
]

{ #category : #accessing }
MUDAliasCommandLine >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
MUDAliasCommandLine >> rawLine [
	^ rawLine
]

{ #category : #accessing }
MUDAliasCommandLine >> rawLine: anObject [
	rawLine := anObject
]
