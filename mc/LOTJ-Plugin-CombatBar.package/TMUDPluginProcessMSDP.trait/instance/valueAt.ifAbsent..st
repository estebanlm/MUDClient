accessing
valueAt: aKey ifAbsent: absentBlock
	^ self values 
		at: aKey
		ifAbsent: absentBlock