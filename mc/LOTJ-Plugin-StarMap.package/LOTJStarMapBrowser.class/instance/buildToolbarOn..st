building
buildToolbarOn: aPresentation
	aPresentation
		act: [ :presentation | self importPointsThen: [ presentation update ] ]
			icon: #import asMUDIcon
			entitled: 'Import points (from planets, moons and systems)';
		act: [ :presentation | self addPointThen: [ presentation update ] ]
			icon: #add asMUDIcon
			entitled: 'Add a point (taken from ''calc'' style)';
		toggleAct: [ :presentation :entity :isOn | self starMapMorph showNames: isOn ]
			icon: #add asMUDIcon
			entitled: 'Show names'
			initialState: self initialShowNames 