descriptions
descriptionTimestamp
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 110;
		label: 'Timestamp';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isTimestamp ]
			write: [ :filter :value | filter timestamp: value ]);
		yourself