private factory
createTypeActionFor: aType
	^ MUDAction new 
		action: [  ];
		title: aType label;
		icon: (self colorIcon: aType color);
		category: 'Room type';
		yourself