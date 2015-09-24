building
buildOn: browser 
	browser column: #filters.
	browser transmit 
		to: #filters;
		andShow: [ :a |
			"a enhancedTabbedArrangement."
			a stackedVerticallyArrangement.
			self filters do: [ :each |
				self areaAt: each ifAbsentPut: [ self buildAreaMorph ].
				a morph 
					title: [ self titleFor: each ];
					display: [ self areaAt: each ];
					initialize: [ :presenter | self dirtyAt: each put: false ]].
			"a updateOn: MUDFilterUpdated from: self announcer.
			a announcer when: MUDPresentationActivated send: #presentationActivated: to: self "]