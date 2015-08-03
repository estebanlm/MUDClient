generation
buildBrowserWithButtons
	| browser |
	
	browser := GLMTabulator new 
		row: #contents;
		row: #actions size: 32;
		yourself.
	
	^ browser