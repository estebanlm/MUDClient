read/write
readWaiting
	^ self readWithOperation: [ :buffer | 
		self socket receiveAvailableDataInto: buffer ]