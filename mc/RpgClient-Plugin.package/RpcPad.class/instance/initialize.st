initialization
initialize
	super initialize.
	self 
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		listDirection: #leftToRight;
		listCentering: #topLeft;
		wrapCentering: #topLeft.
		
	1 to: matrix rows do: [ :rowNumber | 
		1 to: matrix columns do: [ :colNumber | 
			| command |
			command := matrix at: colNumber at: rowNumber.
			self addMorphBack: (command 
				ifNotNil: [ self createCommandButtonFor: command ]
				ifNil: [ self createEmptyButtonWith: [ :text | 
						matrix 
							at: colNumber 
							at: rowNumber 
							put: (RpcPadCommand new 
								commandText: text;
								yourself) ] ] ) ] ]
	