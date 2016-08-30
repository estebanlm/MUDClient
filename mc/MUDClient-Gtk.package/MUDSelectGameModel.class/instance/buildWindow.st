building
buildWindow
	^ GtkWindow new 	
		title: self class title;
		resize: self class defaultExtent;
		add: (GtkBox newHorizontal
			packStart: GtkListBox new;
			packStart: (GtkLabel newLabel: 'TODO');
			yourself);
		yourself