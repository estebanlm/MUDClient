private
buttonMorph: aModel
	^ (Smalltalk ui theme
		newButtonIn: nil 
		for: aModel 
		getState: nil
		action: #execute
		arguments: nil 
		getEnabled: nil 
		label: aModel buttonLabel
		help: aModel glamourAction help)
		getMenuSelector: #buttonMenu:;
		yourself