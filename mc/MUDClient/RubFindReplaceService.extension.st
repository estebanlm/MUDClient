Extension { #name : #RubFindReplaceService }

{ #category : #'*MUDClient' }
RubFindReplaceService class >> reset [
	self flag: #todo. "I think this is not necesary anymore"
	"^ Singleton := nil"
]
