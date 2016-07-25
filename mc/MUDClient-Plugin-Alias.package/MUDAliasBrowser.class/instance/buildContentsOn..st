building
buildContentsOn: composer
	| browser |
	composer custom: (browser := GLMStacker new).
	browser 
		aPane: #aliases;
		aPane: #variables.
	browser transmit to: #aliases; andShow: [ :a | 
		a title: 'Aliases'.
		a custom: self createAliasBrowser ].
	browser transmit to: #variables; andShow: [ :a | 
		a title: 'Global Variables'.
		a custom: self createVariablesBrowser ]