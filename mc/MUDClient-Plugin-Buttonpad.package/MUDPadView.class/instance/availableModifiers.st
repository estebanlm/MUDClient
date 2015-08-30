accessing
availableModifiers
	| mods |
	mods := self buttonPad freeAvailableModifiers.
	^ self pad hasModifier 	
		ifTrue: [ mods copyWithFirst: self pad modifier ]
		ifFalse: [ mods ]