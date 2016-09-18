building
buildWindow
	^ GtkWindow new 	
		title: self class title;
		resize: self class defaultExtent;
		borderWidth: 5;
		add: (GtkBox newVertical
			packStart:  (GtkBox newHorizontal
				packStart: (listPanel := self buildListPanel);
				packStart: (gamePresenter := self createGamePresenter) widget;
				yourself);
			packStart: self buildButtonPanel expand: false fill: false padding: 5;
			yourself);
		yourself