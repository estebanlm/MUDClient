descriptions
descriptionValue
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Value';
		accessor: #value;
		beRequired;
		yourself