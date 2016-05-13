building
buildPad: aPad port: port on: browser
	browser row: port. 
	browser transmit 
		to: port; 
		andShow: [ :a |
			a padActionList in: [ :this | 
				aPad commands do: [ :each | 
					this addAction: (self buildCommand: each) ]]]