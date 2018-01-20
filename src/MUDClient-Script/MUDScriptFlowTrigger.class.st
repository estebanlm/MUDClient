"
I execute a task each time a condition is satisfied. 
The task can decide to continue (exit the flow) or not.

terminal newFlow
	when: '^You manage to locate.*' do: [ :flow |
		found := true.
		flow continue ];
	when: '^You were unable.*' do: #continue;
	do
"
Class {
	#name : #MUDScriptFlowTrigger,
	#superclass : #MUDScriptSuspendTrigger,
	#instVars : [
		'flowConditions'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptFlowTrigger >> continue [
	self deactivate
]

{ #category : #evaluating }
MUDScriptFlowTrigger >> evaluateWith: aString ifMatches: aBlock [
	flowConditions keysAndValuesDo: [ :regexp :block |
		(regexp matches: aString) 
			ifTrue: [ block cull: self ]  ]
]

{ #category : #initialization }
MUDScriptFlowTrigger >> initialize [
	super initialize.
	flowConditions := OrderedDictionary new
]

{ #category : #api }
MUDScriptFlowTrigger >> when: aString do: aBlock [
	flowConditions at: aString asRegexIgnoringCase put: aBlock
]
