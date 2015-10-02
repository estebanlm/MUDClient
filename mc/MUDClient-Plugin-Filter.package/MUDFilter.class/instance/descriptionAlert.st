descriptions
descriptionAlert
	<magritteDescription>

	^ MABooleanDescription new 
		priority: 30;
		label: 'Alert';
		accessor: (MASelectorAccessor read: #isAlert write: #alert:);
		yourself	