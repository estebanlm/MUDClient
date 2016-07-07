descriptions
descriptionActive
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 1000;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isActive ]
			write: [ :filter :value | filter active: value ]);
		yourself