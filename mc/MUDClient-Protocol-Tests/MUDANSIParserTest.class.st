Class {
	#name : #MUDANSIParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'MUDClient-Protocol-Tests'
}

{ #category : #accessing }
MUDANSIParserTest >> parserClass [
	^ MUDANSIParser
]

{ #category : #tests }
MUDANSIParserTest >> testClear [
	|  parsed |
	
	parsed := self 
		parse: Character escape asString, '[2J'
		rule: #clear.
		
	self assert: parsed class equals: MUDANSIClear.
	self assert: parsed value equals: 2
]

{ #category : #tests }
MUDANSIParserTest >> testColor [
	|  parsed |

	parsed := self 
		parse: Character escape asString, '[0;37m'
		rule: #color.
		
	self assert: parsed class equals: MUDANSIColor.
	self deny: parsed isBold.
	self assert: parsed foregroundColor equals: (MUDANSIColor normalColorMapAt: 7).

	parsed := self 
		parse: Character escape asString, '[1;47m'
		rule: #color.
		
	self assert: parsed class equals: MUDANSIColor.
	self assert: parsed isBold.
	self assert: parsed backgroundColor equals: (MUDANSIColor brightColorMapAt: 7).
	
	parsed := self 
		parse: Character escape asString, '[1;31;42m'
		rule: #color.
		
	self assert: parsed class equals: MUDANSIColor.
	self assert: parsed isBold.
	self assert: parsed foregroundColor equals: (MUDANSIColor brightColorMapAt: 1).
	self assert: parsed backgroundColor equals: (MUDANSIColor brightColorMapAt: 2).
	
	parsed := self 
		parse: Character escape asString, '[0;44;33m'
		rule: #color.
		
	self assert: parsed class equals: MUDANSIColor.
	self deny: parsed isBold.
	self assert: parsed foregroundColor equals: (MUDANSIColor normalColorMapAt: 3).
	self assert: parsed backgroundColor equals: (MUDANSIColor normalColorMapAt: 4)
]

{ #category : #tests }
MUDANSIParserTest >> testDocument [
	| parsed |
	
	parsed := self 
		parse: 
			Character escape asString, '[2J', 
			'a text', 
			Character escape asString, '[31m', 
			'color one' 
		rule: #document.
		
	self assert: parsed isCollection.
	self assert: parsed size equals: 4.
	self assert: parsed first value equals: 2.
	self assert: parsed second text equals: 'a text'.
	self assert: parsed third foregroundColor equals: (MUDANSIColor normalColorMapAt: 1).
	self assert: parsed fourth text equals: 'color one'.
]

{ #category : #tests }
MUDANSIParserTest >> testReset [
	|  parsed |
	
	parsed := self 
		parse: Character escape asString, '[0m'
		rule: #reset.
		
	self assert: parsed class equals: MUDANSIReset
]

{ #category : #tests }
MUDANSIParserTest >> testText [
	|  parsed |
	
	parsed := self parse: '[2]'rule: #text.
	self assert: parsed class equals: MUDANSIText.
	self assert: parsed text equals: '[2]'.
	
	parsed := self parse: 'anything not escape'rule: #text.
	self assert: parsed class equals: MUDANSIText.
	self assert: parsed text equals: 'anything not escape'	
]
