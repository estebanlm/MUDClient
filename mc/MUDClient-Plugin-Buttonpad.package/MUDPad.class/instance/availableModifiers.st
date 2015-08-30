descriptions
availableModifiers
	| mods |
	mods := self owner freeAvailableModifiers.
	^ self hasModifier 	
		ifTrue: [ mods copyWithFirst: self modifier ]
		ifFalse: [ mods ]