private
traverseRoom: aRoom position: aPoint do: aBlock
	self 
		traverseRoom: aRoom 
		position: aPoint 
		excluding: Set new 
		do: aBlock  