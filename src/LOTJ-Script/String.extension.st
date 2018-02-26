Extension { #name : #String }

{ #category : #'*LOTJ-Script' }
String >> removeFirstLine [
	^ self removeFirstLines: 1
]

{ #category : #'*LOTJ-Script' }
String >> removeFirstLines: aNumber [
	^ self species streamContents: [ :stream | 
		(self lines allButFirst: aNumber)
			do: [ :each | stream << each ]
			separatedBy: [ stream cr ] ] 
]

{ #category : #'*LOTJ-Script' }
String >> removeLastLine [
	^ self removeLastLines: 1
	
]

{ #category : #'*LOTJ-Script' }
String >> removeLastLines: aNumber [
	^ self species streamContents: [ :stream | 
		(self lines allButLast: aNumber)
			do: [ :each | stream << each ]
			separatedBy: [ stream cr ] ] 
]

{ #category : #'*LOTJ-Script' }
String >> toANSI [
	"transforms a decorated string (style: '&rRED&w string') into an ANSI colored string. 
	This is useful to be echoed"
	^ LOTJTextDecorationParser ansiText: self
	
]

{ #category : #'*LOTJ-Script' }
String >> toLOTJFaceList [
	self ifEmpty: [ ^ #() ].
	^ Array streamContents: [ :stream |
		(self substrings: Character separators) pairsDo: [ :greet :days |
			stream << (LOTJFace name: greet trimBoth days: days asNumber) ] ]
]

{ #category : #'*LOTJ-Script' }
String >> toLOTJInventoryItemList [
	self ifEmpty: [ ^ #() ].
	^ Array streamContents: [ :stream |
		self trimBoth linesDo: [ :each | 
			stream << (LOTJInventoryItem fromString: each trimBoth) ] ]
	
]

{ #category : #'*LOTJ-Script' }
String >> toLOTJShipList [
	self ifEmpty: [ ^ #() ].
	^ Array streamContents: [ :stream |
		(self substrings: '''') pairsDo: [ :shipClass :name |
			stream << (LOTJShip shipClass: shipClass trimBoth name: name) ] ]
	
]
