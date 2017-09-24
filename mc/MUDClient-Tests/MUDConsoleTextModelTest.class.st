Class {
	#name : #MUDConsoleTextModelTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Tests'
}

{ #category : #tests }
MUDConsoleTextModelTest >> testAddParseDecoration [
	| morph |
	
	morph := MUDTerminalTextModel new.
	self assert: morph parseDecoration notNil.
	self assert: morph parseDecoration class equals: MUDANSIDecoration.
	self assert: morph parseDecoration next isNil.
	
	morph addParseDecoration: MUDParseDecoration new.
	self deny: morph parseDecoration next isNil.
	self assert: morph parseDecoration class equals: MUDANSIDecoration.
	self assert: morph parseDecoration next class equals: MUDParseDecoration.
	

]
