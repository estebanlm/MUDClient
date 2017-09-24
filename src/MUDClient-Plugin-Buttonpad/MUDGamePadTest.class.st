Class {
	#name : #MUDGamePadTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Plugin-Buttonpad-Tests'
}

{ #category : #tests }
MUDGamePadTest >> testAddNew [ 
	| buttonPad pad |
	
	buttonPad := MUDPadPlugin game: nil.
	self deny: buttonPad pads isEmpty.
	self assert: buttonPad pads size equals: 1.
	pad := buttonPad pads anyOne.
	self assert: pad notNil.
	self assert: pad name equals: 'Pad 1'.
	pad := buttonPad addNew. 
	self assert: buttonPad pads size equals: 2.
	self assert: buttonPad pads last equals: pad.
	
	
]
