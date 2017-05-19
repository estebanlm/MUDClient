descriptions
descriptionName
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 100;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself
