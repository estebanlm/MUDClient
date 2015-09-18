descriptions
descriptionActive
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 30;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :alias | alias isActive ]
			write: [ :alias :value | self active: value ]);
		yourself