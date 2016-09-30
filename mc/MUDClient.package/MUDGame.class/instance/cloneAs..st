actions
cloneAs: cloneName
	^ (STON fromStream: (STON toString: self) readStream)
		name: cloneName;
		yourself