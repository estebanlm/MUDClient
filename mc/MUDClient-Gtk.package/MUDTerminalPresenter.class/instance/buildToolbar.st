building
buildToolbar
	^ GtkToolbar new
		beIcons;
		in: [ :this | self repopulateToolbar: this ];
		yourself