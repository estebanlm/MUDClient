descriptions
descriptionName 
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		yourself