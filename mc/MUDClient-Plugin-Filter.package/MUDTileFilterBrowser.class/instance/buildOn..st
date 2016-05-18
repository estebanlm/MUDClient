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
					act: [ self editFilter: each ] 
						icon: #edit asMUDIcon 
						entitled: 'Edit filter'; 
					act: [ self clearArea: (self areaAt: each) ] 
						icon: #clear asMUDIcon 
						entitled: 'Clear'; 
					display: [ self areaAt: each ];
					initialize: [ :presenter | self dirtyAt: each put: false ]].
			"a updateOn: MUDFilterUpdated from: self announcer.
			a announcer when: MUDPresentationActivated send: #presentationActivated: to: self "]