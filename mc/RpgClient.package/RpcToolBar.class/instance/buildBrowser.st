building
buildBrowser
	| browser |
	
	browser := GLMTabulator new 
		"row: #miniToolBar size: 20;"
		row: #toolBar;
		yourself.

	"browser transmit 
		to: #miniToolBar;
		andShow: [ :a | self buildMiniToolBarOn: a ]."
		
	browser transmit 
		to: #toolBar;
		andShow:[ :a | self buildToolBarOn: a ].
		
	^ browser