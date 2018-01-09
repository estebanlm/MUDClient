Extension { #name : #Rectangle }

{ #category : #'*LOTJ-Script' }
Rectangle >> regionMap: aBlock [
	| forward |
	forward := true.
	self origin x to: self corner x do: [ :x |
		forward 
			ifTrue: [ 
				self origin y 
					to: self corner y 
					do: [ :y | aBlock value: x value: y ] ]
			ifFalse: [ 
				self corner y 
					to: self origin y 
					by: -1 
					do: [ :y | aBlock value: x value: y ] ].
		forward := forward not ]
]
