building
buildButtonPanel
	^ GtkBox newHorizontal 
		packEnd: ((GtkButton newLabel: 'Launch')
				image: (GtkImage newForm: #connect asMUDIcon);
				alwaysShowImage: true;
				connectClicked: [ self launch ];
				yourself) 
			expand: false 
			fill: false 
			padding: 5;
		yourself