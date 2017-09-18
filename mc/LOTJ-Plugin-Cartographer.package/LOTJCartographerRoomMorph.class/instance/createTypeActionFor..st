private factory
createTypeActionFor: aType
	^ MUDAction new 
		action: [ self changeType: aType ];
		title: aType label;
		icon: (self colorIcon: aType color);
		category: 'Room type';
		yourself