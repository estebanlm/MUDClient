building
buildListPanel
	^ GtkBox newVertical 
		packStart: ((listBox := GtkListBox new)
			connectRowSelected: [ :row | self updateGamePanelWith: (row ifNotNil: [ row child data ]) ];
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