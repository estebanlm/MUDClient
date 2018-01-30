Extension { #name : #SequenceableCollection }

{ #category : #'*LOTJ-Script' }
SequenceableCollection >> at: key ifPresent: aBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the given block optionally with the value associated
	with the key.
	Otherwise, answer nil."

	| v |
	v := self at: key ifAbsent: [^ nil].
	^ aBlock cull: v
]

{ #category : #'*LOTJ-Script' }
SequenceableCollection >> at: key ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	"Lookup the given key in the receiver. If it is present, answer the
	value of evaluating the first block optionally with the value associated
	with the key.
	Otherwise answer the value of the second block."

	self at: key ifPresent: [ :v | ^ aPresentBlock cull: v].
	^ anAbsentBlock value
]

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
