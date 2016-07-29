private building
buildCharacterPanel
	^ self newVerticalPanel
		height: self class lineHeight * 4;
		addMorphBack: ((characterLabel := LabelMorph new) height: self class lineHeight);
		addMorphBack: (self buildHealthPanel height: self class lineHeight);
		addMorphBack: (self buildMovementPanel height: self class lineHeight);
		addMorphBack: (self buildForcePanel height: self class lineHeight);
		yourself