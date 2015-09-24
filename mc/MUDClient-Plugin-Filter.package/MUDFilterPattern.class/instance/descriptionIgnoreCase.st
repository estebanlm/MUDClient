descriptions
descriptionIgnoreCase
	<magritteDescription>

	^ MABooleanDescription new 
		priority: 20;
		label: 'Ignore case';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isIgnoreCase ]
			write: [ :filter :value | filter ignoreCase: value ]);
		yourself	