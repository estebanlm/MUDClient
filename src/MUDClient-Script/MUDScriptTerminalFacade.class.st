"
I'm a façade to provide general access to the terminal.
I'm the most important part of the DSL for scripting, since I provide all important controls.

"
Class {
	#name : #MUDScriptTerminalFacade,
	#superclass : #MUDScriptFacade,
	#category : #'MUDClient-Script-Model'
}

{ #category : #'api control' }
MUDScriptTerminalFacade >> newCondition [
	^ MUDScriptConditionTrigger 
		script: self script 
		evaluator: self evaluator
]

{ #category : #'api control' }
MUDScriptTerminalFacade >> newFlow [
	^ MUDScriptFlowTrigger 		
		script: self script 
		evaluator: self evaluator
]

{ #category : #'api piping' }
MUDScriptTerminalFacade >> newPipe [
	^ MUDScriptPipeTrigger 
		script: self script 
		evaluator: self evaluator
 
]

{ #category : #'api control' }
MUDScriptTerminalFacade >> newWait [
	^ MUDScriptWaitTrigger
		script: self script 
		evaluator: self evaluator
]

{ #category : #'api control' }
MUDScriptTerminalFacade >> newWait: aString [
	^ self newWait
		until: aString;
		yourself
]

{ #category : #'api transmit' }
MUDScriptTerminalFacade >> send: aString [
	self terminal sendFilteringInput: aString
]

{ #category : #'api transmit' }
MUDScriptTerminalFacade >> send: aString andWait: aDuration [
	self terminal sendFilteringInput: aString.
	aDuration wait
]

{ #category : #'api control' }
MUDScriptTerminalFacade >> waitUntil: aString [
	^ self newWait 
		until: aString;
		do
]

{ #category : #'api plugins' }
MUDScriptTerminalFacade >> withPlugin: aClass do: aBlock [
	aBlock value: (self terminal game 
		pluginByClass: aClass 
		ifAbsent: [ nil ])
]
