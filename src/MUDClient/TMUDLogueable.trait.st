"
I add logging traits to my users. 
"
Trait {
	#name : #TMUDLogueable,
	#category : #'MUDClient-Model'
}

{ #category : #accessing }
TMUDLogueable >> log [ 
	^ Logger current
]
