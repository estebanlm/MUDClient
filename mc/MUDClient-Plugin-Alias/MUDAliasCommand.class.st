Class {
	#name : #MUDAliasCommand,
	#superclass : #Object,
	#instVars : [
		'keywords'
	],
	#classVars : [
		'CommandParser'
	],
	#category : 'MUDClient-Plugin-Alias-Parser'
}

{ #category : #'instance creation' }
MUDAliasCommand class >> fromString: aString [ 
	^ self parse: aString
]

{ #category : #'instance creation' }
MUDAliasCommand class >> keywords: anArray [
	^ self new 
		keywords: anArray;
		yourself
]

{ #category : #private }
MUDAliasCommand class >> parse: aString [
	^ self parser 
		parse: aString
		onError: [ self keywords: { MUDAliasCommandKeyword value: aString } ]
]

{ #category : #private }
MUDAliasCommand class >> parser [ 
	^ CommandParser ifNil: [ CommandParser := MUDAliasCommandLineDefinitionParser new ]
		
]

{ #category : #testing }
MUDAliasCommand >> hasUniqueKeyword [
	^ self keywords size = 1
]

{ #category : #testing }
MUDAliasCommand >> hasUniqueKeywordWithoutArguments [
	^ self hasUniqueKeyword
		and: [ self keywords first hasArgument not ]
]

{ #category : #accessing }
MUDAliasCommand >> keywords [
	^ keywords
]

{ #category : #accessing }
MUDAliasCommand >> keywords: anObject [
	keywords := anObject
]

{ #category : #testing }
MUDAliasCommand >> matches: aCommandLine [
	self hasUniqueKeywordWithoutArguments ifTrue: [ ^ self matchesUniqueString: aCommandLine ].
	^ self matchesKeywords: aCommandLine
]

{ #category : #testing }
MUDAliasCommand >> matchesKeywords: line [
	self keywords size = line keywords size ifFalse: [ ^ false ].	
	self keywords withIndexDo: [ :each :index |
		 each value = (line keywords at: index) value
			ifFalse: [ ^ false ] ].		
	^ true
	

]

{ #category : #testing }
MUDAliasCommand >> matchesUniqueString: line [
	^ (line rawLine
		compare: self keywords first value 
		caseSensitive: false) == 2
]
