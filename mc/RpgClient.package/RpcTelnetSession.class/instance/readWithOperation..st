read/write
readWithOperation: operationBlock 
	| buffer readed rawData |
	
	self socket waitForData.		
	buffer := String new: self class bufferSize.
	readed := operationBlock value: buffer.
	rawData := buffer copyFrom: 1 to: readed.
	^ self isRawModeOn
		ifTrue: [ rawData ]
		ifFalse: [ self processReadData: rawData ]