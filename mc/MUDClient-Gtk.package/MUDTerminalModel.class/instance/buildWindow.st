building
buildWindow
	^ GtkWindow new 
		autoRelease;
		title: self class defaultTitle;
		resize: self class defaultExtent;
		add: (GtkBox newVertical
			packStart: (toolbar := self buildToolbar) expand: false fill: false padding: 0;
			packStart: self buildContents;
			yourself);
		"connectShow: [ MorphicUIManager new terminateUIProcess ];"
		connectHide: [ 
			self windowClosed: (WindowClosed new window: self). 
			"MorphicUIManager new spawnNewProcess" ];
		yourself
	