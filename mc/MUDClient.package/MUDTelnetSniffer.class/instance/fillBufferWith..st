as yet unclassified
fillBufferWith: aByteArray
	buffer compact.
	1 to: aByteArray size do: [ :index | 
		buffer nextPut: (aByteArray at: index) ]