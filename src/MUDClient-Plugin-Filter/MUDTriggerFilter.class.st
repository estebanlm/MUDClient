Class {
	#name : #MUDTriggerFilter,
	#superclass : #MUDFilter,
	#instVars : [
		'output'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #accessing }
MUDTriggerFilter class >> label [
	^ 'Triggers'
]

{ #category : #private }
MUDTriggerFilter >> applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal [ 
	^ aPlugin applyTriggerFilter: self to: aStream line: aLine in: aTerminal
	
]

{ #category : #descriptions }
MUDTriggerFilter >> descriptionOutput [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 100;
		label: 'Output';
		accessor: #output;
		lineCount: 8;
		beRequired;
		yourself
]

{ #category : #testing }
MUDTriggerFilter >> isTrigger [ 
	^ true
]

{ #category : #accessing }
MUDTriggerFilter >> output [
	^ output
]

{ #category : #accessing }
MUDTriggerFilter >> output: anObject [
	output := anObject
]
