"
I'm pattern in a filter. 
Each filter can have many instances of me, indicating different kind of behaviour. 
For example, I can have a match who eats some lines (it filters also subsequent lines after matching)
"
Class {
	#name : #MUDFilterPattern,
	#superclass : #Object,
	#instVars : [
		'filter',
		'pattern',
		'eatLines',
		'ignoreCase',
		'compiledPattern'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDFilterPattern class >> stonAllInstVarNames [
	^ #( filter pattern eatLines ignoreCase )
]

{ #category : #private }
MUDFilterPattern >> compilePattern [
	^ RxParser preferredMatcherClass
		for: (RxParser new parse: self pattern)
		ignoreCase: self isIgnoreCase
]

{ #category : #accessing }
MUDFilterPattern >> compiledPattern [
	^ compiledPattern ifNil: [ compiledPattern := self compilePattern ]
]

{ #category : #descriptions }
MUDFilterPattern >> descriptionContainer [
	^ super descriptionContainer
		tkAcceptIcon: #accept asMUDIcon;
		tkCancelIcon: #cancel asMUDIcon;
		yourself
]

{ #category : #descriptions }
MUDFilterPattern >> descriptionEatLines [
	<magritteDescription>
	
	^ MANumberDescription new 
		priority: 30;
		label: 'Eat extra lines';
		accessor: #eatLines;
		yourself
]

{ #category : #descriptions }
MUDFilterPattern >> descriptionIgnoreCase [
	<magritteDescription>

	^ MABooleanDescription new 
		priority: 20;
		label: 'Ignore case';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isIgnoreCase ]
			write: [ :filter :value | filter ignoreCase: value ]);
		yourself	
]

{ #category : #descriptions }
MUDFilterPattern >> descriptionPattern [ 
	<magritteDescription>

	^ MAStringDescription new 
		priority: 10;
		label: 'Match';
		accessor: #pattern;
		beRequired;
		yourself	
]

{ #category : #accessing }
MUDFilterPattern >> eatLines [
	^ eatLines
]

{ #category : #accessing }
MUDFilterPattern >> eatLines: aNumber [
	eatLines := aNumber
]

{ #category : #accessing }
MUDFilterPattern >> filter [
	^ filter
]

{ #category : #accessing }
MUDFilterPattern >> filter: anObject [
	filter := anObject
]

{ #category : #accessing }
MUDFilterPattern >> ignoreCase: aBoolean [ 
	ignoreCase := aBoolean.
	self resetCompiledPattern
]

{ #category : #initialization }
MUDFilterPattern >> initialize [ 
	super initialize.
	self ignoreCase: true.
]

{ #category : #testing }
MUDFilterPattern >> isAlert [
	^ self filter isAlert
]

{ #category : #testing }
MUDFilterPattern >> isIgnoreCase [
	^ ignoreCase
]

{ #category : #testing }
MUDFilterPattern >> matches: aString [ 
	^ self compiledPattern matches: aString

]

{ #category : #accessing }
MUDFilterPattern >> pattern [
	^ pattern
]

{ #category : #accessing }
MUDFilterPattern >> pattern: anObject [
	pattern := anObject.
	self resetCompiledPattern
]

{ #category : #printing }
MUDFilterPattern >> printOn: stream [ 
	super printOn: stream.
	stream << $( << (self pattern ifNil: [ 'Undefined' ]) << $)
]

{ #category : #private }
MUDFilterPattern >> resetCompiledPattern [
	compiledPattern := nil
]
