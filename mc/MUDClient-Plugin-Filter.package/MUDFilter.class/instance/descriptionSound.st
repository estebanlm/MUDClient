descriptions
descriptionSound
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 900;
		label: 'Sound';
		accessor: #soundName;
		options: self class availableSoundsWithLabels keys;
		morphClass: MADropListMorph;
		yourself