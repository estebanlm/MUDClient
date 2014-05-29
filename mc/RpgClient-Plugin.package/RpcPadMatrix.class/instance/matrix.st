private
matrix 
	^ matrix ifNil: [ 
		matrix := Matrix 
			rows: self class defaultRows 
			columns: self class defaultColumns ]