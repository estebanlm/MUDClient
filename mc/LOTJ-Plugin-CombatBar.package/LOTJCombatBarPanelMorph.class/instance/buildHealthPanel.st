private building
buildHealthPanel
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class healthLabel);
		addMorphBack: (healthBar := self newPercentBar);
		yourself