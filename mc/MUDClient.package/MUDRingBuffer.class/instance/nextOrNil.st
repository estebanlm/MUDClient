accessing
nextOrNil

	| item |

	self isEmpty ifTrue: [ ^ nil ].	
	overlapp 	ifTrue: [ overlapp := false ].
	
	item := array at: readIndex.	
	self incrementRead.	
		
	^ item	