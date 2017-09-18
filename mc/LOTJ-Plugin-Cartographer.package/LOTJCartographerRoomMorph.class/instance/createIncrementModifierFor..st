private factory
createIncrementModifierFor: aDirection
	^ MUDAction new 
		action: [ self incrementDistance: aDirection ];
		title: 'Increment distance ', aDirection label;
		category: 'Edition';
		yourself	