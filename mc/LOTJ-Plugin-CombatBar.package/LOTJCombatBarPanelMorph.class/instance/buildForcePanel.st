private building
buildForcePanel
	^ self newHorizontalPanel
		height: self class lineHeight;
		addMorphBack: (self newHorizontalLabel: self class forceLabel);
		addMorphBack: (forceBar := self newPercentBar);
		yourself