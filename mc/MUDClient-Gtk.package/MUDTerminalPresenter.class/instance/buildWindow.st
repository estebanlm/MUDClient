building
buildWindow
	^ GtkWindow new 
		title: self class defaultTitle;
		resize: self class defaultExtent;
		add: (GtkBox newVertical
			packStart: (toolbar := self buildToolbar) expand: false fill: false padding: 0;
			packStart: self buildContents;
			yourself);
		connectHide: [ 
			self windowClosed: (WindowClosed new window: self) ];
		yourself
	