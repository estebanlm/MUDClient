private
increment: anIndex

	^ anIndex = array size 
		ifTrue: [ 1 ]
		ifFalse: [ anIndex + 1 ]