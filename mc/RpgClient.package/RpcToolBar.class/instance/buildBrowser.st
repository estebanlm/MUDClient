building
buildBrowser
	| newBrowser |
	
	newBrowser := GLMTabulator new 
		"row: #miniToolBar size: 20;"
		row: #toolBar;
		yourself.

	"browser transmit 
		to: #miniToolBar;
		andShow: [ :a | self buildMiniToolBarOn: a ]."
		
	newBrowser transmit 
		to: #toolBar;
		andShow:[ :a | self buildToolBarOn: a ].
		
	^ newBrowser