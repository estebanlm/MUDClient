drawing
drawNameOn: aCanvas
	| w font |
	font := self class font.
	w := font widthOfString: self point name. 
	aCanvas 
		drawString: self point name 
		at: self bounds center + ((w / 2) asInteger negated @ 5)
		font: font
		color: self fontColor