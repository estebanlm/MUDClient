descriptions
descriptionNotifyPosition
	<magritteDescription>
	| positions |
	
	positions := MUDGrowlMorph positionsAndLabels keys.
	^ MASingleOptionDescription new 
		priority: 110;
		label: 'Alert Position';
		accessor: #notifyPosition;
		options: positions;
		morphClass: MADropListMorph;
		yourself