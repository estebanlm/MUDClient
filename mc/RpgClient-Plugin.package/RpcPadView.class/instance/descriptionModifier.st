descriptions
descriptionModifier
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 20;
		label: 'Modifier';
		accessor: #(pad modifier);
		reference: (MAStringDescription new 
			accessor: #asString;
			asContainer);
		options: self availableModifiers;
		morphClass: MADropListMorph;
		yourself