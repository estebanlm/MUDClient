building
buildButtonPanel
	^ GtkBox newHorizontal 
		packEnd: ((GtkButton newLabel: 'Launch')
				alwaysShowImage: true;
				image: (GtkImage newForm: #connect asMUDIcon);
				connectClicked: [ self launch ];
				yourself) 
			expand: false 
			fill: false 
			padding: 5;
		yourself