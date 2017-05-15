enumerating
do: aBlock

	[ self isEmpty ] whileFalse: [ 
		aBlock value: self nextOrNil
	].