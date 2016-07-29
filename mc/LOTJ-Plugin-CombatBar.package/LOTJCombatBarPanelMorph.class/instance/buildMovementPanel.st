private building
buildMovementPanel
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class movementLabel);
		addMorphBack: (movementBar := self newPercentBar);
		yourself