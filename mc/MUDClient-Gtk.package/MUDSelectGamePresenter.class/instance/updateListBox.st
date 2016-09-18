updating
updateListBox
	listBox 
		unselectAll;
		removeAll.
	self games 
		collect: [ :each | (GtkLabel newLabel: each name) data: each ]
		thenDo: [ :each | listBox insert: each at: -1 ].
	listBox showAll.