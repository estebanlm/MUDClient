Extension { #name : #String }

{ #category : #'*LOTJ-Script' }
String >> toLOTJFaceList [
	^ Array streamContents: [ :stream |
		(self substrings: Character separators) pairsDo: [ :greet :days |
			stream << (LOTJFace name: greet trimBoth days: days asNumber) ] ]
]

{ #category : #'*LOTJ-Script' }
String >> toLOTJInventoryItemList [
	^ Array streamContents: [ :stream |
		self trimBoth linesDo: [ :each | 
			stream << (LOTJInventoryItem fromString: each trimBoth) ] ]
	
]

{ #category : #'*LOTJ-Script' }
String >> toLOTJShipList [
	^ Array streamContents: [ :stream |
		(self substrings: '''') pairsDo: [ :shipClass :name |
			stream << (LOTJShip shipClass: shipClass trimBoth name: name) ] ]
	
]
