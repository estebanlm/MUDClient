private building
buildEnemyPanel
	^ self newVerticalPanel
		height: self class lineHeight * 2;
		addMorphBack: ((enemyLabel := LabelMorph new) height: self class lineHeight);
		addMorphBack: ((enemyBar := self newPercentBar) height: self class lineHeight);
		yourself