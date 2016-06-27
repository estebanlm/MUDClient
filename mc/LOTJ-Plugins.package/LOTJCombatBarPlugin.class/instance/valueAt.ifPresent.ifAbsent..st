accessing
valueAt: aKey ifPresent: presentBlock ifAbsent: absentBlock
	^ self values 
		at: aKey
		ifPresent: presentBlock
		ifAbsent: absentBlock