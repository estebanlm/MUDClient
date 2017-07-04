descriptions
descriptionExits
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Exits';
		accessor: #exitsAsString;
		morphClass: TkTextMorph;
		beReadonly;
		yourself