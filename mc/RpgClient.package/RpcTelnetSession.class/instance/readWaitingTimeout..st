read/write
readWaitingTimeout: aNumber
	^ self readWithOperation: [ :buffer | 
		self socket receiveDataTimeout: aNumber into: buffer ]