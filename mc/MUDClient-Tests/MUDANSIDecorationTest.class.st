Class {
	#name : #MUDANSIDecorationTest,
	#superclass : #TestCase,
	#instVars : [
		'decoration'
	],
	#category : 'MUDClient-Tests'
}

{ #category : #running }
MUDANSIDecorationTest >> setUp [ 
	super setUp.
	decoration := MUDANSIDecoration new
]

{ #category : #tests }
MUDANSIDecorationTest >> testParse [
	| text |
	
	text := decoration parse: ('New space

[1;37mObvious exits:[0m
 [1;37mNorth    [0m - New space
 [1;37mEast     [0m - New space
 [1;37mSouth    [0m - New space
 [1;37mWest     [0m - New space
 [1;37mNortheast[0m - New space [Power Generator]
 [1;37mUp       [0m - New space [Docking Bay]
> ' copyReplaceAll: String cr with: String lf).
		
	self 
		assert: text asString
		equals: ('New space

Obvious exits:
 North     - New space
 East      - New space
 South     - New space
 West      - New space
 Northeast - New space [Power Generator]
 Up        - New space [Docking Bay]
> ' copyReplaceAll: String cr with: String lf)
]
