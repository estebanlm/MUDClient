descriptions
descriptionAlertColor
	<magritteDescription>

	^ MASingleOptionDescription new 
		priority: 30;
		label: 'Alert Color';
		accessor: #alertColor;
		options: { Color darkGray. Color lightGray. Color green. Color yellow. Color orange. Color red };
		morphClass: MADropListMorph; 
		yourself
			