descriptions
descriptionAlertColor
	<magritteDescription>

	^ MAColorDescription new 
		priority: 40;
		label: 'Alert Color';
		accessor: #alertColor;
		morphClass: MUDColorMorph; 
		yourself