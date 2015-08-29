descriptions
descriptionName
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #(pad name);
		beRequired;
		yourself