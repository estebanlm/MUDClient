specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :column |
			column 
				newRow: #toolBarPanel height: 20;
			 	newRow: [ :row | 
					row 
						newColumn: #mapPanel;
						newColumn: #detailPanel ] ]