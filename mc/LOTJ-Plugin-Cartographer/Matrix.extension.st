Extension { #name : #Matrix }

{ #category : #'*LOTJ-Plugin-Cartographer' }
Matrix >> rows [ 
	| rows |
	rows := (Array new: self numberOfRows) writeStream.
	self rowsDo: [ :eachRow | rows nextPut: eachRow ].
	^ rows contents
]

{ #category : #'*LOTJ-Plugin-Cartographer' }
Matrix >> rowsDo: aBlock [
	1 to: self numberOfRows do: [ :index | 
		aBlock value: (self atRow: index) ]
]
