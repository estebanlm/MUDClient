Class {
	#name : #LOTJInventoryItemTest,
	#superclass : #TestCase,
	#category : #'LOTJ-Script'
}

{ #category : #tests }
LOTJInventoryItemTest >> testFromString [
	| item |
	
	item := LOTJInventoryItem fromString: 'A bolt of demicot silk (19)'.
	self assert: item quantity equals: 19.
	self assert: item name equals: 'A bolt of demicot silk'.

	item := LOTJInventoryItem fromString: 'A bloody, foul-smelling Kinrath sweat gland'.
	self assert: item quantity equals: 1.
	self assert: item name equals: 'A bloody, foul-smelling Kinrath sweat gland'.	
]
