building
buildWindow
	^ GtkWindow new 	
		title: self class title;
		resize: self class defaultExtent;
		add: (GtkBox newVertical
			packStart:  (GtkBox newHorizontal
				packStart: self buildListPanel;
				packStart: (GtkLabel newLabel: 'TODO');
				yourself);
			packStart: self buildButtonPanel expand: false fill: false padding: 5;
			yourself);
		yourself