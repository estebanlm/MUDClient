Extension { #name : #Collection }

{ #category : #'*LOTJ-Script' }
Collection >> show [
	(MUDScriptCollectionBrowser for: self) open
]

{ #category : #'*LOTJ-Script' }
Collection >> showTitle: aString [
	(MUDScriptCollectionBrowser for: self) 
		title: aString;
		open
]
