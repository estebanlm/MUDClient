building
buildListPanel
	^ GtkBox newVertical 
		packStart: (GtkListBox new
			addAll: (self games collect: [ :each | (GtkLabel newLabel: each name) data: each ]);
			connectRowSelected: [ :w | self updateGamePanelWith: (w ifNotNil: [ w data ]) ];
			"flow: (MarsFlow new
				port: 'row-selected';
				inputTransform: #data;
				output: [ gamePanel ];
				outputTransform: [ :game | game asPresenter widget ];
				yourself);" 
			yourself);
		packStart: (GtkToolbar new 
				beIconSizeSmallToolbar;
				beIcons;
				add: ((GtkToolButton newForm: #add asMUDIcon label: 'Add')
					tooltipText: 'Add a MUD to the list';
					connectClicked: [ self addNew ];
					yourself) ;
				yourself)
			expand: false
			fill: false
			padding: 0;
		yourself