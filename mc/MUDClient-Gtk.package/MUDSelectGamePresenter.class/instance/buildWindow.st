building
buildWindow
	^ GtkWindow new 	
		title: self class title;
		resize: self class defaultExtent;
		borderWidth: 5;
		add: (GtkBox newVertical
			packStart:  (GtkBox newHorizontal
				packStart: self buildListPanel;
				packStart: (gamePanel := GtkBox newVertical);
				yourself);
			packStart: self buildButtonPanel expand: false fill: false padding: 5;
			yourself);
		yourself