descriptions
descriptionSound
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 50;
		label: 'Sound';
		accessor: #soundName;
		options: self class availableSoundsWithLabels keys;
		morphClass: MADropListMorph;
		yourself