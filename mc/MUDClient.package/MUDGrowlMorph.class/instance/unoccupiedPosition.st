position
unoccupiedPosition
	self notifyPosition = #bottomLeft ifTrue: [ ^ self unoccupiedPositionBottomLeft ].
	self notifyPosition = #topRight ifTrue: [ ^ self unoccupiedPositionTopRight ].
	self notifyPosition = #bottomRight ifTrue: [ ^ self unoccupiedPositionBottomRight ].
	self notifyPosition = #topLeft ifTrue: [ ^ self unoccupiedPositionTopLeft ].
	^ 0@0	
	