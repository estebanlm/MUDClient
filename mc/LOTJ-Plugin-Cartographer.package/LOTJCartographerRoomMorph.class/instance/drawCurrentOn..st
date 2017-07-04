drawing
drawCurrentOn: canvas
	| w h font |
	font := LOTJCartographerMapMorph font.
	w := font widthOfString: '<'. 
	h := font height.
	canvas 
		drawString: '<' 
		at: self topRight 
		font: font
		color: Color white