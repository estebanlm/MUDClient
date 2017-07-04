drawing
drawLabelOn: aCanvas
	| w font |
	font := self class font.
	w := font widthOfString: selectedRoom name. 
	aCanvas 
		drawString: selectedRoom name
		at: ((self width - w) / 2) asInteger @ 5 
		font: font
		color: self fontColor	