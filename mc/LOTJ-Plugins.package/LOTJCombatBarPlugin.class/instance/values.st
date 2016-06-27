accessing
values
	^ values ifNil: [ 
		values := Dictionary withAll: (self reportVariables collect: [ :each | each -> nil ] ) ]