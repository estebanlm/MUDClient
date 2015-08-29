building
buildContentsOn: aPresentation
	aPresentation tabulator 
		with: [ :browser | self buildOn: browser ]
	