descriptions
descriptionAlertColor
	<magritteDescription>

	^ MAColorDescription new 
		priority: 100;
		label: 'Alert Color';
		accessor: #alertColor;
		morphClass: MUDColorMorph; 
		yourself