descriptions
descriptionPatterns
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		priority: 20;
		label: 'Patterns';
		classes: { MUDFilterPattern };
		reference: MUDFilterPattern basicNew descriptionPattern asContainer;
		accessor: #patterns;
		display: [ :v | v pattern truncateWithElipsisTo: 28 ];
		default: OrderedCollection new;
		morphClass: TkOneToManyFastListMorph;
		tkRowsToShow: 5;
		tkAddIcon: #add asMUDIcon;
		tkEditIcon: #edit asMUDIcon;
		tkRemoveIcon: #delete asMUDIcon;
		yourself