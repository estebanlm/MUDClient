accessing
values
	^ self basicValues ifNil: [ 
		self basicValues: (Dictionary withAll: (self reportVariables collect: [ :each | each -> nil ] )) ]