Extension { #name : #String }

{ #category : #'*LOTJ-Script' }
String >> toLOTJInventoryItemList [
	^ Array streamContents: [ :stream |
		self trimBoth linesDo: [ :each | 
			stream << (LOTJInventoryItem fromString: each trimBoth) ] ]
	
]
