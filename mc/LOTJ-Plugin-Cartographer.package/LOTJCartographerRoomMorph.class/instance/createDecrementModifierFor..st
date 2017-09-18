private factory
createDecrementModifierFor: aDirection
	^ MUDAction new 
		action: [ self decrementDistance: aDirection ];
		title: 'Decrement distance ', aDirection label;
		category: 'Edition';
		yourself	