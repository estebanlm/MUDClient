building
buildWindow
	^ GtkWindow new 
		autoRelease;
		title: self class defaultTitle;
		resize: self class defaultExtent;
		add: (GtkBox newVertical
			packStart: self buildToolbar expand: false fill: false padding: 0;
			packStart: self buildContents;
			yourself);
		yourself
	