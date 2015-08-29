accessing
findBy: aBlock ifAbsent: absentBlock 
	^ (self selectOne: aBlock)
		ifNil: absentBlock