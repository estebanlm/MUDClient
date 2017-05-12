accessing
preferredExtent
	^ (super preferredExtent x)@(MUDAlertFilter basicNew magritteDescription tkHeight)