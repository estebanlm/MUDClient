building
buildOn: browser
	"browser title: [ self title ]. "
	browser column: #filters.
	browser transmit 
		to: #filters;
		andShow: [ :a |
			a morph display: [ self areaMorph ] ].