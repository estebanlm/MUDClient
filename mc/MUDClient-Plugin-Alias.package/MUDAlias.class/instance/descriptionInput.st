descriptions
descriptionInput
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Input';
		accessor: #input;
		beRequired;
		yourself