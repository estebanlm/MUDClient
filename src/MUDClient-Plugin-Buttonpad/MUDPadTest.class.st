Class {
	#name : #MUDPadTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Buttonpad-Tests'
}

{ #category : #tests }
MUDPadTest >> testComandAt [
	| pad |
	
	pad := MUDPad new.
	pad commandAt: 1 text: 'test 1'.
	pad commandAt: 2 text: 'test 2'.
	
	self assert: (pad commandAt: 1) text equals: 'test 1'.
	self assert: (pad commandAt: 2) text equals: 'test 2'.
	3 to: 10 do: [ :index | 
		self assert: (pad commandAt: index) text isNil ]
	
]

{ #category : #tests }
MUDPadTest >> testComandAtText [
	| pad |
	
	pad := MUDPad new.
	pad commandAt: 1 text: 'test'.
	self assert: (pad commandAt: 1) text equals: 'test'
]

{ #category : #tests }
MUDPadTest >> testNew [
	| pad |
	
	pad := MUDPad new.
	self assert: pad name equals: 'Pad'.
	self assert: pad commands size equals: MUDPad padSize
]
