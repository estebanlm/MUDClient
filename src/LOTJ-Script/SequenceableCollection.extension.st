Extension { #name : #SequenceableCollection }

{ #category : #'*LOTJ-Script' }
SequenceableCollection >> groupsOf: n collect: aBlock [
	^ self species streamContents: [ :stream |
		self groupsOf: n do: [ :eachGroup | stream nextPut: (aBlock value: eachGroup)  ] ]
]

{ #category : #'*LOTJ-Script' }
SequenceableCollection >> groupsOf: n do: aBlock [
	| index |
	
	index := 1. 
	[ index < self size ]
	whileTrue: [ 
		aBlock value: (self copyFrom: index to: ((index + n - 1)  min: self size)).
		index := index + n ]
]
