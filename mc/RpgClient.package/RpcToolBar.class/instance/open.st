showing
open 
	| width |
	
	self close.
	
	browser := self buildBrowser.
	browser startOn: Object new.
	
	width := RpcIcons uniqueInstance connectIcon width + 8. "Taking icons as example"
	morph := self defaultRenderer render: browser.
	morph 
		color: Smalltalk ui theme windowColor;
		hResizing: #rigid;
		vResizing: #spaceFill;
		position: 0@0;
		layoutFrame: (LayoutFrame 
			fractions: (0@0 corner: 0@1) 
			offsets: (width@0 corner: 0@0));
		extent: width@(World height);
		beSticky.
	morph openInWorld