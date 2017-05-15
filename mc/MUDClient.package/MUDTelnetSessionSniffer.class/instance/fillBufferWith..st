accessing
fillBufferWith: aByteArray
	1 to: aByteArray size do: [ :index | 
		buffer nextPut: (aByteArray at: index) ]