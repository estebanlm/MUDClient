descriptions
descriptionActive
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 60;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isActive ]
			write: [ :filter :value | filter active: value ]);
		yourself