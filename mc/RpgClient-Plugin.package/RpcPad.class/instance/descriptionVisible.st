descriptions
descriptionVisible 
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 30;
		label: 'Visible';
		accessor: (MAPluggableAccessor 
			read: [ :pad | pad isVisible ]
			write: [ :pad :value | pad visible: value ]);
		yourself