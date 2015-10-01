descriptions
descriptionAlert
	<magritteDescription>

	^ MABooleanDescription new 
		priority: 20;
		label: 'Alert';
		accessor: (MASelectorAccessor read: #isAlert write: #alert:);
		yourself	